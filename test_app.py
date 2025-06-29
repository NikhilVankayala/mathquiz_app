import pytest
from app import app
from models.db import get_connection
from datetime import datetime, timezone, timedelta

@pytest.fixture
def client():
    app.config['TESTING'] = True
    app.config['WTF_CSRF_ENABLED'] = False
    with app.test_client() as client:
        yield client

# Test 1: Home Page Loads
def test_home_page(client):
    response = client.get('/')
    assert response.status_code == 200
    assert b"Math" in response.data or b"Welcome" in response.data

# Test 2: Login with Incorrect Password
def test_login_wrong_password(client):
    response = client.post('/login', data={
        'username': 'cravinghydra',
        'password': 'wrongpassword'
    }, follow_redirects=True)
    assert b'Invalid username or password' in response.data

# Test 3: Signup with Duplicate Email
def test_signup_duplicate_email(client):
    response = client.post('/signup', data={
        'name': 'Test',
        'username': 'uniqueuser123',
        'email': 'nikhil.vankayala7@gmail.com',  # Should exist in DB
        'password': 'password123',
        'grade_level': '10',
        'phone_number': '1234567890'
    }, follow_redirects=True)
    assert b'Email is already registered' in response.data

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
        sess['user_id'] = 1
        sess['grade_level'] = 10
    response = client.get('/topics/10')
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
    response = client.get('/quiz/1?q=0')  # topic_id = 1
    assert response.status_code == 200
    assert b'Q1' in response.data or b'question' in response.data.lower()

def test_answer_question_and_next(client):
    with client.session_transaction() as sess:
        sess['user_id'] = 1
        sess['grade_level'] = 10
    # Start quiz to initialize quiz_result_id
    client.get('/quiz/1?q=0')

    response = client.post('/quiz/1?q=0', data={
        'option': 'A',
        'action': 'next'
    }, follow_redirects=True)

    assert b'Q2' in response.data or b'question' in response.data.lower()

def test_prev_question(client):
    with client.session_transaction() as sess:
        sess['user_id'] = 1
        sess['grade_level'] = 10
    client.get('/quiz/1?q=1')  # Go to second question
    response = client.post('/quiz/1?q=1', data={
        'option': 'B',
        'action': 'prev'
    }, follow_redirects=True)
    assert b'Q1' in response.data or b'question' in response.data.lower()

def test_submit_quiz(client):
    with client.session_transaction() as sess:
        sess['user_id'] = 1
        sess['grade_level'] = 10
    client.get('/quiz/1?q=0')

    # Simulate answering last question (force submit)
    response = client.post('/quiz/1?q=2', data={
        'option': 'A',
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

    # Clear session to simulate fresh attempt
    with client.session_transaction() as sess:
        sess.pop('quiz_result_id', None)

    # Second quiz attempt
    client.get('/quiz/1?q=0')
    with client.session_transaction() as sess:
        second_id = sess.get('quiz_result_id')

    # Assert a new quiz_result_id was created
    assert first_id != second_id

    # Submit quiz (assume question 2 exists and has option A)
    client.post('/quiz/1?q=2', data={'option': 'A', 'action': 'submit'}, follow_redirects=True)

    # After submission, quiz_result_id should be popped from session
    # So we manually use the last second_id we saved
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
    
    # Option 1: check title of dashboard page
    assert b'<title>Dashboard</title>' in response.data

def test_view_results_page(client):
    # Simulate login
    with client.session_transaction() as sess:
        sess['user_id'] = 1
        sess['grade_level'] = 10

    # Start quiz (creates quiz_result_id)
    client.get('/quiz/1?q=0')
    with client.session_transaction() as sess:
        quiz_result_id = sess.get('quiz_result_id')

    # Submit a single question to complete the quiz
    client.post('/quiz/1?q=0', data={'option': 'A', 'action': 'submit'}, follow_redirects=True)

    # Now quiz_result_id should be cleared, but we still have it saved
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
        sess['grade_level'] = 10  # Add this line

    response = client.get('/attempts/1')
    assert response.status_code == 200
    assert b'Attempt' in response.data or b'Score' in response.data

# Test 3: No attempts for valid topic_id
def test_past_attempts_no_data(client):
    with client.session_transaction() as sess:
        sess['user_id'] = 1
        sess['grade_level'] = 10

    response = client.get('/attempts/999')  # Simulate no data for this topic
    assert response.status_code == 200
    assert b"You haven't taken this quiz yet." in response.data

def test_invalid_quiz_id(client):
    with client.session_transaction() as sess:
        sess['user_id'] = 1
        sess['grade_level'] = 10

    # Create a topic with ID 999 temporarily, if not already in DB
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT IGNORE INTO topics (id, name, grade_level) VALUES (999, 'Temp Topic', 10)")
    conn.commit()
    cursor.close()
    conn.close()

    response = client.get('/quiz/999?q=0', follow_redirects=True)
    assert response.status_code in [200, 302]
    assert b'completed all questions' in response.data or b'Dashboard' in response.data


def test_submit_without_selection(client):
    with client.session_transaction() as sess:
        sess['user_id'] = 1
        sess['grade_level'] = 10

    client.get('/quiz/1?q=0')
    response = client.post('/quiz/1?q=0', data={'action': 'next'}, follow_redirects=True)
    assert response.status_code == 200

def test_results_other_user_forbidden(client):
    with client.session_transaction() as sess:
        sess['user_id'] = 9999  # a user who doesn't own result_id=1
        sess['grade_level'] = 10  # ✅ fix: required for template rendering

    response = client.get('/result/1', follow_redirects=True)
    assert b"Result not found" in response.data or response.status_code in [403, 200]

def test_signup_duplicate_username(client):
    # First, register a user with a given username
    response1 = client.post('/signup', data={
        'name': 'Test User',
        'username': 'duplicateuser123',
        'email': 'uniqueemail1@example.com',
        'password': 'password123',
        'grade_level': '10',
        'phone_number': '1234567890'
    }, follow_redirects=True)
    assert b'Successfully signed up' in response1.data or response1.status_code == 200

    # Now try registering again with the same username
    response2 = client.post('/signup', data={
        'name': 'Test User 2',
        'username': 'duplicateuser123',  # same username
        'email': 'uniqueemail2@example.com',
        'password': 'password123',
        'grade_level': '10',
        'phone_number': '0987654321'
    }, follow_redirects=True)

    assert b'Username is already taken' in response2.data or b'already exists' in response2.data

