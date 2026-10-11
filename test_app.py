import pytest
from app import app
from models.db import get_connection
from werkzeug.security import check_password_hash
import mysql.connector


# ---------------------------------------------------------------------------
# Fixtures
# ---------------------------------------------------------------------------

@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client


@pytest.fixture(autouse=True)
def db_cleanup():
    """Reset the test database to a known state before every test.
    Runs against mathquiz_test (set in conftest.py locally, buildspec.yml in CI)."""
    conn = None
    cursor = None
    try:
        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("SET FOREIGN_KEY_CHECKS = 0;")
        for table in ['question_result', 'quiz_results', 'quizzes', 'users', 'questions', 'topics']:
            cursor.execute(f"TRUNCATE TABLE {table};")
        cursor.execute("SET FOREIGN_KEY_CHECKS = 1;")

        # Topics: 1 and 10 have questions, 999 deliberately has none
        cursor.execute("INSERT INTO topics (id, name, grade_level) VALUES (1, 'Algebra Basics', 10);")
        cursor.execute("INSERT INTO topics (id, name, grade_level) VALUES (10, 'Advanced Algebra', 10);")
        cursor.execute("INSERT INTO topics (id, name, grade_level) VALUES (999, 'Temp Topic', 10);")

        # Users (plain-text passwords; tests that need a real login sign up instead)
        cursor.execute("INSERT INTO users (id, name, username, email, password, grade_level, phone_number) "
                       "VALUES (1, 'Test User', 'testuser', 'test@example.com', 'testpass', 10, '1234567890');")
        cursor.execute("INSERT INTO users (id, name, username, email, password, grade_level, phone_number) "
                       "VALUES (2, 'Existing User', 'existinguser', 'existing@example.com', 'some_password', 10, '9876543210');")

        # Topic 1: three questions, correct answers B, B, C
        cursor.execute("INSERT INTO questions (id, topic_id, question_text, option_a, option_b, option_c, option_d, correct_option) "
                       "VALUES (1, 1, 'What is 2+2?', '3', '4', '5', '6', 'B');")
        cursor.execute("INSERT INTO questions (id, topic_id, question_text, option_a, option_b, option_c, option_d, correct_option) "
                       "VALUES (2, 1, 'What is 5-3?', '1', '2', '3', '4', 'B');")
        cursor.execute("INSERT INTO questions (id, topic_id, question_text, option_a, option_b, option_c, option_d, correct_option) "
                       "VALUES (3, 1, 'What is 6*2?', '8', '10', '12', '14', 'C');")
        # Topic 10: one question (used by the topic-switching test)
        cursor.execute("INSERT INTO questions (id, topic_id, question_text, option_a, option_b, option_c, option_d, correct_option) "
                       "VALUES (4, 10, 'What is 3^2?', '6', '9', '12', '27', 'B');")

        conn.commit()
    except mysql.connector.Error as err:
        print(f"Database setup/cleanup error: {err}")
        if conn:
            conn.rollback()
        raise
    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()

    yield


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

def login_as(client, user_id=1, grade_level=10):
    """Fake a logged-in user by writing straight into the session cookie."""
    with client.session_transaction() as sess:
        sess['user_id'] = user_id
        sess['grade_level'] = grade_level


def current_attempt_id(client):
    with client.session_transaction() as sess:
        return sess.get('quiz_result_id')


def query_one(sql, params=()):
    """Run a SELECT against the test DB and return the first row as a dict."""
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    try:
        cursor.execute(sql, params)
        return cursor.fetchone()
    finally:
        cursor.close()
        conn.close()


def execute(sql, params=()):
    """Run a write against the test DB."""
    conn = get_connection()
    cursor = conn.cursor()
    try:
        cursor.execute(sql, params)
        conn.commit()
    finally:
        cursor.close()
        conn.close()


def redirects_to(response, path):
    """True if the response is a redirect to the given path."""
    return response.status_code == 302 and response.location.endswith(path)


def take_and_submit_quiz(client, answers):
    """Answer topic 1's questions in order and submit on the last one.
    `answers` is a list like ['B', 'A', 'C']. Returns the attempt ID."""
    client.get('/quiz/1?q=0')
    attempt_id = current_attempt_id(client)
    for i, option in enumerate(answers):
        action = 'submit' if i == len(answers) - 1 else 'next'
        client.post(f'/quiz/1?q={i}', data={'option': option, 'action': action})
    return attempt_id


# ---------------------------------------------------------------------------
# Pages and login guards
# ---------------------------------------------------------------------------

def test_home_page(client):
    response = client.get('/')
    assert response.status_code == 200
    assert b"Math" in response.data or b"Welcome" in response.data


@pytest.mark.parametrize('url', ['/dashboard', '/topics/10', '/quiz/1', '/result/1', '/attempts/1'])
def test_protected_pages_redirect_to_login(client, url):
    # Checks the redirect itself, not just that the word "Login" appears somewhere
    response = client.get(url)
    assert redirects_to(response, '/login')


# ---------------------------------------------------------------------------
# Auth
# ---------------------------------------------------------------------------

def test_signup_then_login_reaches_dashboard(client):
    # Real end-to-end flow: no faked session
    response = client.post('/signup', data={
        'name': 'New Student', 'username': 'newstudent', 'email': 'new@example.com',
        'password': 'secret123', 'grade_level': '10', 'phone_number': '5550001111'
    })
    assert redirects_to(response, '/login')

    response = client.post('/login', data={'username': 'newstudent', 'password': 'secret123'},
                           follow_redirects=True)
    assert response.request.path == '/dashboard'
    assert b'newstudent' in response.data


def test_signup_stores_hashed_password(client):
    client.post('/signup', data={
        'name': 'Hash Check', 'username': 'hashcheck', 'email': 'hash@example.com',
        'password': 'secret123', 'grade_level': '10', 'phone_number': '5550002222'
    })
    user = query_one("SELECT password FROM users WHERE username = %s", ('hashcheck',))
    assert user['password'] != 'secret123'                       # not stored as plain text
    assert check_password_hash(user['password'], 'secret123')    # but still verifies


def test_login_wrong_password(client):
    client.post('/signup', data={
        'name': 'Real User', 'username': 'realuser', 'email': 'real@example.com',
        'password': 'rightpass', 'grade_level': '10', 'phone_number': '5550003333'
    })
    response = client.post('/login', data={'username': 'realuser', 'password': 'wrongpass'},
                           follow_redirects=True)
    assert b'Invalid username or password' in response.data
    with client.session_transaction() as sess:
        assert 'user_id' not in sess


def test_signup_duplicate_email_rejected(client):
    response = client.post('/signup', data={
        'name': 'Dup Email', 'username': 'dupemail', 'email': 'existing@example.com',
        'password': 'password123', 'grade_level': '10', 'phone_number': '5550004444'
    })
    assert redirects_to(response, '/signup')
    assert query_one("SELECT id FROM users WHERE username = %s", ('dupemail',)) is None


def test_signup_duplicate_username_rejected(client):
    response = client.post('/signup', data={
        'name': 'Dup Username', 'username': 'existinguser', 'email': 'other@example.com',
        'password': 'password123', 'grade_level': '10', 'phone_number': '5550005555'
    })
    assert redirects_to(response, '/signup')
    count = query_one("SELECT COUNT(*) AS n FROM users WHERE username = %s", ('existinguser',))
    assert count['n'] == 1


def test_logout_clears_session(client):
    login_as(client)
    response = client.get('/logout', follow_redirects=True)
    assert b'You have been signed out' in response.data
    # The real proof: protected pages are locked again
    assert redirects_to(client.get('/dashboard'), '/login')


# ---------------------------------------------------------------------------
# Topics
# ---------------------------------------------------------------------------

def test_topics_page_lists_grade_topics(client):
    login_as(client)
    response = client.get('/topics/10')
    assert response.status_code == 200
    assert b'Algebra Basics' in response.data
    assert b'Advanced Algebra' in response.data


# ---------------------------------------------------------------------------
# Quiz flow
# ---------------------------------------------------------------------------

def test_start_quiz_shows_first_question(client):
    login_as(client)
    response = client.get('/quiz/1?q=0')
    assert response.status_code == 200
    assert b'What is 2+2?' in response.data


def test_next_shows_second_question(client):
    login_as(client)
    client.get('/quiz/1?q=0')
    response = client.post('/quiz/1?q=0', data={'option': 'B', 'action': 'next'},
                           follow_redirects=True)
    assert b'What is 5-3?' in response.data


def test_prev_shows_first_question(client):
    login_as(client)
    client.get('/quiz/1?q=1')
    response = client.post('/quiz/1?q=1', data={'option': 'B', 'action': 'prev'},
                           follow_redirects=True)
    assert b'What is 2+2?' in response.data


def test_skipped_question_saved_as_incorrect(client):
    login_as(client)
    client.get('/quiz/1?q=0')
    attempt_id = current_attempt_id(client)
    response = client.post('/quiz/1?q=0', data={'action': 'next'}, follow_redirects=True)
    assert response.status_code == 200

    row = query_one("SELECT user_option, is_correct FROM question_result WHERE quiz_result_id = %s",
                    (attempt_id,))
    assert row['user_option'] is None
    assert row['is_correct'] == 0


def test_changing_an_answer_updates_instead_of_duplicating(client):
    login_as(client)
    client.get('/quiz/1?q=0')
    attempt_id = current_attempt_id(client)
    client.post('/quiz/1?q=0', data={'option': 'A', 'action': 'next'})
    client.post('/quiz/1?q=0', data={'option': 'B', 'action': 'next'})   # go back and change it

    count = query_one("SELECT COUNT(*) AS n FROM question_result WHERE quiz_result_id = %s",
                      (attempt_id,))
    assert count['n'] == 1
    row = query_one("SELECT user_option, is_correct FROM question_result WHERE quiz_result_id = %s",
                    (attempt_id,))
    assert row['user_option'] == 'B'
    assert row['is_correct'] == 1


def test_topic_with_no_questions_redirects_to_dashboard(client):
    login_as(client)
    response = client.get('/quiz/999?q=0')
    assert redirects_to(response, '/dashboard')


def test_invalid_question_index_does_not_crash(client):
    login_as(client)
    assert client.get('/quiz/1?q=abc').status_code == 200   # falls back to question 0
    response = client.get('/quiz/1?q=-1')
    assert b'What is 2+2?' in response.data                  # not the last question


# ---------------------------------------------------------------------------
# Scoring and submission
# ---------------------------------------------------------------------------

def test_score_counts_correct_answers(client):
    login_as(client)
    attempt_id = take_and_submit_quiz(client, ['B', 'A', 'C'])   # right, wrong, right

    result = query_one("SELECT score, status FROM quiz_results WHERE id = %s", (attempt_id,))
    assert result['status'] == 'submitted'
    assert result['score'] == 2


def test_submit_redirects_to_results_and_clears_session(client):
    login_as(client)
    attempt_id = take_and_submit_quiz(client, ['B', 'B', 'C'])
    assert current_attempt_id(client) is None

    response = client.get(f'/result/{attempt_id}')
    assert response.status_code == 200


def test_time_taken_is_real_seconds(client):
    # Regression test: NOW() - creation_time used to subtract dates as plain numbers,
    # so a 90-second attempt could be stored as 130 or more.
    login_as(client)
    client.get('/quiz/1?q=0')
    attempt_id = current_attempt_id(client)
    execute("UPDATE quiz_results SET creation_time = NOW() - INTERVAL 90 SECOND WHERE id = %s",
            (attempt_id,))

    client.post('/quiz/1?q=0', data={'option': 'B', 'action': 'submit'})

    result = query_one("SELECT time_taken FROM quiz_results WHERE id = %s", (attempt_id,))
    assert 89 <= result['time_taken'] <= 95


# ---------------------------------------------------------------------------
# Attempts
# ---------------------------------------------------------------------------

def test_retake_after_submit_starts_new_attempt(client):
    login_as(client)
    first_id = take_and_submit_quiz(client, ['B', 'B', 'C'])
    client.get('/quiz/1?q=0')
    second_id = current_attempt_id(client)
    assert second_id is not None
    assert second_id != first_id


def test_switching_topics_starts_new_attempt(client):
    # Regression test: the session's attempt used to be reused for a different topic
    login_as(client)
    client.get('/quiz/1?q=0')
    topic1_attempt = current_attempt_id(client)
    client.post('/quiz/1?q=0', data={'option': 'B', 'action': 'next'})

    response = client.get('/quiz/10?q=0')
    topic10_attempt = current_attempt_id(client)
    assert topic10_attempt != topic1_attempt
    assert b'What is 3^2?' in response.data

    client.post('/quiz/10?q=0', data={'option': 'B', 'action': 'next'})
    # Topic 1's attempt still has only its own single answer
    count = query_one("SELECT COUNT(*) AS n FROM question_result WHERE quiz_result_id = %s",
                      (topic1_attempt,))
    assert count['n'] == 1


# ---------------------------------------------------------------------------
# Results and access control
# ---------------------------------------------------------------------------

def test_owner_can_view_result(client):
    login_as(client, user_id=1)
    attempt_id = take_and_submit_quiz(client, ['B', 'B', 'C'])
    response = client.get(f'/result/{attempt_id}')
    assert response.status_code == 200
    assert b'What is 2+2?' in response.data


def test_other_user_cannot_view_result(client):
    # Regression test for the IDOR fix: the result EXISTS but belongs to user 1
    login_as(client, user_id=1)
    attempt_id = take_and_submit_quiz(client, ['B', 'B', 'C'])

    login_as(client, user_id=2)
    response = client.get(f'/result/{attempt_id}')
    assert redirects_to(response, '/dashboard')
    assert b'What is 2+2?' not in response.data


def test_missing_result_redirects(client):
    login_as(client)
    assert redirects_to(client.get('/result/999999'), '/dashboard')


def test_in_progress_result_not_shown(client):
    login_as(client)
    client.get('/quiz/1?q=0')
    attempt_id = current_attempt_id(client)
    assert redirects_to(client.get(f'/result/{attempt_id}'), '/dashboard')


# ---------------------------------------------------------------------------
# Past attempts
# ---------------------------------------------------------------------------

def test_past_attempts_shows_submitted_attempt(client):
    login_as(client)
    take_and_submit_quiz(client, ['B', 'B', 'C'])
    response = client.get('/attempts/1')
    assert response.status_code == 200
    assert b'What is 2+2?' in response.data


def test_past_attempts_empty_topic(client):
    login_as(client)
    response = client.get('/attempts/999')
    assert response.status_code == 200
    assert b"You haven't taken this quiz yet." in response.data


def test_past_attempts_unknown_topic_redirects(client):
    login_as(client)
    assert redirects_to(client.get('/attempts/123456'), '/dashboard')
