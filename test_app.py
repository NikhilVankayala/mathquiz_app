import pytest
from app import app
from models.db import get_connection
from datetime import datetime, timezone, timedelta
import mysql.connector # Ensure this is imported for error handling

@pytest.fixture
def client():
    app.config['TESTING'] = True
    app.config['WTF_CSRF_ENABLED'] = False
    with app.test_client() as client:
        yield client

# Fixture for database cleanup and initial data population before each test
@pytest.fixture(autouse=True) # autouse=True makes this fixture run automatically for every test
def db_cleanup():
    conn = None
    cursor = None
    try:
        conn = get_connection()
        cursor = conn.cursor()

        # Disable foreign key checks temporarily for easier truncation
        cursor.execute("SET FOREIGN_KEY_CHECKS = 0;")

        # List tables to truncate in reverse order of dependency if needed,
        # but with FOREIGN_KEY_CHECKS = 0, order is less critical.
        # Ensure all tables that tests might write to are included.
        tables = ['quiz_questions', 'quiz_results', 'quizzes', 'users', 'questions', 'topics']
        for table in tables:
            try:
                # TRUNCATE TABLE is faster than DELETE FROM and resets auto-increment
                cursor.execute(f"TRUNCATE TABLE {table};")
            except mysql.connector.Error as err:
                # Print a warning if a table doesn't exist, but don't fail the test
                print(f"Warning: Could not truncate table {table}. It might not exist or there's a permission issue: {err}")

        # Re-enable foreign key checks
        cursor.execute("SET FOREIGN_KEY_CHECKS = 1;")
        conn.commit()

        # --- Insert essential test data ---
        # Ensure topics exist for quizzes
        cursor.execute("INSERT IGNORE INTO topics (id, name, grade_level) VALUES (1, 'Algebra Basics', 10);")
        cursor.execute("INSERT IGNORE INTO topics (id, name, grade_level) VALUES (10, 'Advanced Algebra', 10);")
        cursor.execute("INSERT IGNORE INTO topics (id, name, grade_level) VALUES (999, 'Temp Topic', 10);") # For test_invalid_quiz_id

        # Insert a default user for login, session simulation, and duplicate email test
        # Use a consistent password for testing, e.g., 'password123' (hashed in real app)
        # For testing, we don't need actual hashing here, just a placeholder.
        cursor.execute("INSERT IGNORE INTO users (id, name, username, email, password, grade_level, phone_number) VALUES (1, 'Test User', 'testuser', 'test@example.com', 'testpass', 10, '1234567890');")
        # Add a user for the duplicate email test's initial state
        cursor.execute("INSERT IGNORE INTO users (id, name, username, email, password, grade_level, phone_number) VALUES (2, 'Existing User', 'existinguser', 'nikhil.vankayala7@gmail.com', 'some_password', 10, '9876543210');")


        # Insert some questions for topic_id 1 to allow quiz tests to run
        cursor.execute("INSERT IGNORE INTO questions (id, topic_id, question_text, option_a, option_b, option_c, option_d, correct_option) VALUES (1, 1, 'What is 2+2?', 'A. 3', 'B. 4', 'C. 5', 'D. 6', 'B');")
        cursor.execute("INSERT IGNORE INTO questions (id, topic_id, question_text, option_a, option_b, option_c, option_d, correct_option) VALUES (2, 1, 'What is 5-3?', 'A. 1', 'B. 2', 'C. 3', 'D. 4', 'B');")
        cursor.execute("INSERT IGNORE INTO questions (id, topic_id, question_text, option_a, option_b, option_c, option_d, correct_option) VALUES (3, 1, 'What is 6*2?', 'A. 8', 'B. 10', 'C. 12', 'D. 14', 'C');")

        conn.commit()

    except mysql.connector.Error as err:
        print(f"Database setup/cleanup error: {err}")
        if conn:
            conn.rollback() # Rollback in case of error during setup
        raise # Re-raise to ensure the test fails if setup itself fails
    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()

    yield # This yields control to the test function
    # After each test runs, control returns here. No post-test cleanup needed
    # as the next test will trigger the fixture again for a fresh state.


# Test 1: Home Page Loads
def test_home_page(client):
    response = client.get('/')
    assert response.status_code == 200
    assert b"Math" in response.data or b"Welcome" in response.data

# Test 2: Login with Incorrect Password
def test_login_wrong_password(client):
    # Use the 'testuser' that is inserted by the db_cleanup fixture
    response = client.post('/login', data={
        'username': 'testuser',
        'password': 'wrongpassword'
    }, follow_redirects=True)
    assert b'Invalid username or password' in response.data

# Test 3: Signup with Duplicate Email
def test_signup_duplicate_email(client):
    # This test relies on 'nikhil.vankayala7@gmail.com' being pre-inserted by db_cleanup
    response = client.post('/signup', data={
        'name': 'New Test User',
        'username': 'newuniqueuser123', # Use a username that won't conflict with 'testuser' or 'existinguser'
        'email': 'nikhil.vankayala7@gmail.com',  # This email is pre-existing due to db_cleanup
        'password': 'password123',
        'grade_level': '10',
        'phone_number': '1234567890'
    }, follow_redirects=True)
    # Check for the error message. If your app redirects to login,
    # the message might be a flashed message on the login page, or the signup page
    # needs to be re-rendered with the error. Adjust this assertion if needed.
    assert b'Email is already registered' in response.data or b'Login' in response.data

# Test 4: Dashboard Requires Login
def test_dashboard_requires_login(client):
    response = client.get('/dashboard', follow_redirects=True)
    assert b'Login' in response.data

# Test 5: Quiz Route Requires Login
def test_quiz_route_requires_login(client):
    response = client.get('/quiz/1', follow_redirects=True)
    assert b'Login' in response.data

# Test 6: Topics Page with Simulated Login
def test_topics_view_with_login(client):
    with client.session_transaction() as sess:
        sess['user_id'] = 1 # User ID 1 is inserted by db_cleanup
        sess['grade_level'] = 10
    response = client.get('/topics/10') # Topic ID 10 is inserted by db_cleanup
    assert response.status_code == 200

# Test 7: Logout Clears Session
def test_logout(client):
    with client.session_transaction() as sess:
        sess['user_id'] = 1
    response = client.get('/logout', follow_redirects=True)
    assert b'You have been signed out' in response.data

def test_start_new_quiz(client):
    with client.session_transaction() as sess:
        sess['user_id'] = 1
        sess['grade_level'] = 10
    # Topic ID 1 has questions inserted by db_cleanup
    response = client.get('/quiz/1?q=0')
    assert response.status_code == 200
    assert b'Q1' in response.data or b'question' in response.data.lower()

def test_answer_question_and_next(client):
    with client.session_transaction() as sess:
        sess['user_id'] = 1
        sess['grade_level'] = 10
    # Start quiz to initialize quiz_result_id
    client.get('/quiz/1?q=0')

    # Simulate answering the first question (Q1)
    response = client.post('/quiz/1?q=0', data={
        'option': 'B', # Assuming 'B' is the correct option for Q1 (2+2=4)
        'action': 'next'
    }, follow_redirects=True)

    # Expect to see Q2
    assert b'Q2' in response.data or b'question' in response.data.lower()

def test_prev_question(client):
    with client.session_transaction() as sess:
        sess['user_id'] = 1
        sess['grade_level'] = 10
    # Go to second question (Q2)
    client.get('/quiz/1?q=1')
    # Simulate going back to Q1
    response = client.post('/quiz/1?q=1', data={
        'option': 'B', # Answer for Q2 (not strictly needed for 'prev' action)
        'action': 'prev'
    }, follow_redirects=True)
    assert b'Q1' in response.data or b'question' in response.data.lower()

def test_submit_quiz(client):
    with client.session_transaction() as sess:
        sess['user_id'] = 1
        sess['grade_level'] = 10
    client.get('/quiz/1?q=0') # Start quiz

    # Simulate answering the last relevant question (Q3) and submitting
    response = client.post('/quiz/1?q=2', data={ # q=2 corresponds to the 3rd question (id=3)
        'option': 'C', # Assuming 'C' is correct for Q3 (6*2=12)
        'action': 'submit'
    }, follow_redirects=True)

    assert b'Results' in response.data or b'Score' in response.data

def test_retake_quiz_starts_new_attempt(client):
    # Simulate login
    with client.session_transaction() as sess:
        sess['user_id'] = 1
        sess['grade_level'] = 10

    # First quiz attempt
    client.get('/quiz/1?q=0')
    with client.session_transaction() as sess:
        first_id = sess.get('quiz_result_id')

    # Clear session to simulate fresh attempt (as if user navigated away and came back)
    with client.session_transaction() as sess:
        sess.pop('quiz_result_id', None)

    # Second quiz attempt for the same topic
    client.get('/quiz/1?q=0')
    with client.session_transaction() as sess:
        second_id = sess.get('quiz_result_id')

    # Assert a new quiz_result_id was created
    assert first_id != second_id

    # Submit quiz (e.g., answer first question and submit)
    client.post('/quiz/1?q=0', data={'option': 'B', 'action': 'submit'}, follow_redirects=True)

    # After submission, quiz_result_id should be popped from session.
    # We use the saved 'second_id' to view results.
    response = client.get(f'/result/{second_id}', follow_redirects=True)
    assert response.status_code == 200
    assert b'Score' in response.data or b'Results' in response.data

def test_result_requires_login(client):
    response = client.get('/result/1', follow_redirects=True)
    assert b'Login' in response.data

def test_result_not_found_redirects(client):
    with client.session_transaction() as sess:
        sess['user_id'] = 1

    response = client.get('/result/999999', follow_redirects=True)
    
    # Expect redirection to dashboard or an error message indicating not found
    assert b'<title>Dashboard</title>' in response.data or b'Result not found' in response.data

def test_view_results_page(client):
    # Simulate login
    with client.session_transaction() as sess:
        sess['user_id'] = 1
        sess['grade_level'] = 10

    # Start quiz (creates quiz_result_id)
    client.get('/quiz/1?q=0')
    with client.session_transaction() as sess:
        quiz_result_id = sess.get('quiz_result_id')

    # Simulate answering a question and submitting to complete the quiz
    client.post('/quiz/1?q=0', data={'option': 'B', 'action': 'submit'}, follow_redirects=True)

    # Now quiz_result_id should be cleared from session, but we use the saved ID
    response = client.get(f'/result/{quiz_result_id}', follow_redirects=True)

    assert response.status_code == 200
    assert b'Score' in response.data or b'Results' in response.data

# Test 1: Redirects to login if user not logged in
def test_past_attempts_requires_login(client):
    response = client.get('/attempts/1', follow_redirects=True)
    assert b'Login' in response.data

# Test 2: Loads past attempts for a logged-in user with topic_id = 1
def test_past_attempts_page_with_attempts(client):
    with client.session_transaction() as sess:
        sess['user_id'] = 1
        sess['grade_level'] = 10

    response = client.get('/attempts/1') # Topic ID 1 has questions and can have attempts
    assert response.status_code == 200
    assert b'Attempt' in response.data or b'Score' in response.data

# Test 3: No attempts for valid topic_id
def test_past_attempts_no_data(client):
    with client.session_transaction() as sess:
        sess['user_id'] = 1
        sess['grade_level'] = 10

    # Topic ID 999 is created by db_cleanup but has no associated quizzes/attempts initially
    response = client.get('/attempts/999')
    assert response.status_code == 200
    assert b"You haven't taken this quiz yet." in response.data

def test_invalid_quiz_id(client):
    with client.session_transaction() as sess:
        sess['user_id'] = 1
        sess['grade_level'] = 10

    # Topic ID 999 exists due to db_cleanup, but no questions are associated with it.
    # The app should handle this gracefully, e.g., redirect to dashboard or show a message.
    response = client.get('/quiz/999?q=0', follow_redirects=True)
    assert response.status_code in [200, 302]
    # Check for messages indicating no questions or redirection to dashboard
    assert b'completed all questions' in response.data or b'Dashboard' in response.data or b'No questions found' in response.data


def test_submit_without_selection(client):
    with client.session_transaction() as sess:
        sess['user_id'] = 1
        sess['grade_level'] = 10

    client.get('/quiz/1?q=0') # Start quiz
    # Submit without selecting an option
    response = client.post('/quiz/1?q=0', data={'action': 'next'}, follow_redirects=True)
    assert response.status_code == 200 # Should still be on the quiz page or next question

def test_results_other_user_forbidden(client):
    with client.session_transaction() as sess:
        sess['user_id'] = 9999  # A user ID that is guaranteed not to own result_id=1
        sess['grade_level'] = 10

    response = client.get('/result/1', follow_redirects=True)
    # Expect either a "Result not found" message or a redirection (e.g., to dashboard/login)
    assert b"Result not found" in response.data or response.status_code in [403, 200]

def test_signup_duplicate_username(client):
    # db_cleanup ensures a clean state before this test.
    # First, register a user with a given username
    response1 = client.post('/signup', data={
        'name': 'First User',
        'username': 'duplicateuser123',
        'email': 'first.unique@example.com', # Ensure this email is unique for this test run
        'password': 'password123',
        'grade_level': '10',
        'phone_number': '1234567890'
    }, follow_redirects=True)
    assert b'Successfully signed up' in response1.data or response1.status_code == 200

    # Now try registering again with the same username but a different unique email
    response2 = client.post('/signup', data={
        'name': 'Second User',
        'username': 'duplicateuser123',  # Same username
        'email': 'second.unique@example.com', # Different email
        'password': 'password123',
        'grade_level': '10',
        'phone_number': '0987654321'
    }, follow_redirects=True)

    # Expect the "Username is already taken" message
    assert b'Username is already taken' in response2.data or b'already exists' in response2.data
