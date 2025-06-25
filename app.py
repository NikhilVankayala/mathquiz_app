from flask import Flask, render_template, request, redirect, session, flash, url_for
from werkzeug.security import generate_password_hash, check_password_hash
from models.db import get_connection
from datetime import datetime, timezone

app = Flask(__name__)
app.secret_key = 'nikhilv30'

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        name = request.form['name']
        username = request.form['username']
        password = request.form['password']
        email = request.form['email']
        grade = request.form['grade_level']
        phone_number = request.form['phone_number']

        hashed_pw = generate_password_hash(password)

        conn = get_connection()
        cursor = conn.cursor()

        try:
            cursor.execute("SELECT * FROM users WHERE email = %s", (email,))
            existing_user = cursor.fetchone()
            if existing_user:
                flash('Email is already registered. Please use a different email or log in.', 'danger')
                return redirect('/signup')

            cursor.execute("SELECT * FROM users WHERE username = %s", (username,))
            existing_username = cursor.fetchone()
            if existing_username:
                flash('Username is already taken. Please choose another one.', 'danger')
                return redirect('/signup')
            
            cursor.execute("""
                INSERT INTO users (name, username, email, password, grade_level, phone_number)
                VALUES (%s, %s, %s, %s, %s, %s)
            """, (name, username, email, hashed_pw, grade, phone_number))
            conn.commit()

            flash('Account created! You can now log in.', 'success')
            return redirect('/login')

        except Exception as e:
            flash(f"Error: {e}", 'danger')
        finally:
            cursor.close()
            conn.close()

    return render_template('signup.html')

@app.route('/login', methods=['GET', 'POST'])

def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        conn = get_connection()
        cursor = conn.cursor(dictionary=True)

        cursor.execute("SELECT * FROM users WhERE username = %s",(username,))
        user = cursor.fetchone()

        cursor.close()
        conn.close()

        if user and check_password_hash(user['password'], password):
            session['user_id'] = user['id']
            session['username'] = user['username']
            session['grade_level'] = user['grade_level']
            flash('Login successful!', 'success')
            return redirect('/dashboard')
        else:
            flash('Invalid username or password.', 'danger')

    return render_template('login.html')


@app.route('/dashboard')
def dashboard():
    if 'user_id' not in session:
        return redirect('/login')
    grade_level = session.get('grade_level')
    username = session.get('username') 
    return render_template('dashboard.html', grade_level=grade_level, username=username)

@app.route('/topics/<int:grade>')
def topics(grade):
    if 'user_id' not in session:
        return redirect('/login')

    user_id = session['user_id']
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

    # Get all topics for this grade
    cursor.execute("SELECT * FROM topics WHERE grade_level = %s", (grade,))
    topics = cursor.fetchall()

    # Fetch all submitted quiz results for this user
    cursor.execute("""
        SELECT qr.score, q.topic_id
        FROM quiz_results qr
        JOIN quizzes q ON qr.quiz_id = q.id
        WHERE qr.user_id = %s AND qr.status = 'submitted'
    """, (user_id,))
    quiz_data = cursor.fetchall()

    # Track scores per topic
    topic_scores = {}
    attempted_topic_ids = set()

    for row in quiz_data:
        topic_id = row['topic_id']
        score = row['score']
        attempted_topic_ids.add(topic_id)

        if topic_id not in topic_scores:
            topic_scores[topic_id] = []
        topic_scores[topic_id].append(score)

    # Add completion and attempt status to each topic
    for topic in topics:
        tid = topic['id']
        scores = topic_scores.get(tid, [])
        topic['attempted'] = tid in attempted_topic_ids
        topic['completed'] = any(s >= 8 for s in scores)

    # Check if user has completed all topics in this grade
    all_completed = all(topic['completed'] for topic in topics) if topics else False

    cursor.close()
    conn.close()

    return render_template(
        'topics.html',
        topics=topics,
        grade=grade,
        attempted_topic_ids=attempted_topic_ids,
        all_completed=all_completed
    )

@app.route('/quiz/<int:topic_id>', methods=['GET', 'POST'])
def quiz(topic_id):
    if 'user_id' not in session:
        return redirect('/login')

    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    user_id = session['user_id']
    q_index = int(request.args.get('q', 0))

    cursor.execute("SELECT id FROM quizzes WHERE topic_id = %s", (topic_id,))
    quiz = cursor.fetchone()

    if not quiz:
        grade_level = session['grade_level']
        cursor.execute("""
            INSERT INTO quizzes (topic_id, grade_level, time_limit)
            VALUES (%s, %s, %s)
        """, (topic_id, grade_level, 600))
        conn.commit()
        quiz_id = cursor.lastrowid
    else:
        quiz_id = quiz['id']

    quiz_result_id = session.get('quiz_result_id')

    # Fresh attempt handling
    if not quiz_result_id:
        cursor.execute("""
            INSERT INTO quiz_results (user_id, quiz_id, status)
            VALUES (%s, %s, 'in_progress')
        """, (user_id, quiz_id))
        conn.commit()
        quiz_result_id = cursor.lastrowid
        session['quiz_result_id'] = quiz_result_id
        session['per_question_start_time'] = {}  # RESET timers on new quiz

    # Load questions
    cursor.execute("SELECT * FROM questions WHERE topic_id = %s", (topic_id,))
    questions = cursor.fetchall()

    if q_index >= len(questions):
        flash("You've completed all questions!", "info")
        return redirect('/dashboard')

    current_question = questions[q_index]

    cursor.execute("""
        SELECT user_option FROM question_result
        WHERE quiz_result_id = %s AND question_id = %s
    """, (quiz_result_id, current_question['id']))
    existing_answer = cursor.fetchone()
    current_question['user_option'] = existing_answer['user_option'] if existing_answer else None

    # --- Per-Question Timer ---
    if 'per_question_start_time' not in session:
        session['per_question_start_time'] = {}

    if str(q_index) not in session['per_question_start_time']:
        session['per_question_start_time'][str(q_index)] = datetime.utcnow().isoformat()

    start_time = datetime.fromisoformat(session['per_question_start_time'][str(q_index)])
    elapsed = (datetime.utcnow() - start_time).total_seconds()
    time_left = max(0, 180 - int(elapsed))  # 3 minutes max

    # --- Handle POST ---
    if request.method == 'POST':
        selected = request.form.get('option')
        is_correct = selected == current_question['correct_option'] if selected else False

        cursor.execute("""
            SELECT id FROM question_result
            WHERE quiz_result_id = %s AND question_id = %s
        """, (quiz_result_id, current_question['id']))
        existing = cursor.fetchone()

        if existing:
            cursor.execute("""
                UPDATE question_result
                SET user_option = %s, is_correct = %s
                WHERE id = %s
            """, (selected, is_correct, existing['id']))
        else:
            cursor.execute("""
                INSERT INTO question_result (quiz_result_id, question_id, user_option, is_correct)
                VALUES (%s, %s, %s, %s)
            """, (quiz_result_id, current_question['id'], selected, is_correct))
        conn.commit()

        action = request.form.get('action')
        if action == "next":
            return redirect(url_for('quiz', topic_id=topic_id, q=q_index + 1))
        elif action == "prev" and q_index > 0:
            return redirect(url_for('quiz', topic_id=topic_id, q=q_index - 1))
        elif action == "submit":
            cursor.execute("""
                SELECT COUNT(*) AS correct FROM question_result
                WHERE quiz_result_id = %s AND is_correct = TRUE
            """, (quiz_result_id,))
            score = cursor.fetchone()['correct']

            cursor.execute("""
                UPDATE quiz_results
                SET score = %s, status = 'submitted', time_taken = NOW() - creation_time
                WHERE id = %s
            """, (score, quiz_result_id))
            conn.commit()
            session.pop('quiz_result_id', None)
            session.pop('per_question_start_time', None)
            return redirect(url_for('results', result_id=quiz_result_id))

    cursor.close()
    conn.close()

    return render_template('quiz_question.html',
                           question=current_question,
                           question_number=q_index,
                           q_index=q_index,
                           total_questions=len(questions),
                           topic_id=topic_id,
                           time_left=time_left)

@app.route('/result/<int:result_id>')
def results(result_id):
    if 'user_id' not in session:
        return redirect('/login')

    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

    # Get quiz result info and associated topic_id (can be NULL)
    cursor.execute("""
        SELECT qr.score, qr.time_taken, qr.status,
               q.topic_id,
               qr.creation_time
        FROM quiz_results qr
        JOIN quizzes q ON qr.quiz_id = q.id
        WHERE qr.id = %s
    """, (result_id,))
    result = cursor.fetchone()

    if not result:
        flash("Result not found.", "danger")
        return redirect('/dashboard')

    topic_id = result['topic_id']

    # Get total number of questions (based on topic_id or cumulative)
    if topic_id:
        cursor.execute("SELECT COUNT(*) AS total FROM questions WHERE topic_id = %s", (topic_id,))
    else:
        cursor.execute("SELECT COUNT(*) AS total FROM questions")
    result['total_questions'] = cursor.fetchone()['total']

    # Format time
    time_taken_sec = result['time_taken'] or 0
    minutes, seconds = divmod(time_taken_sec, 60)
    formatted_time = f"{minutes}m {seconds}s"

    # Get each answered question and user responses
    cursor.execute("""
        SELECT 
            qs.question_text,
            qs.option_a, qs.option_b, qs.option_c, qs.option_d,
            qs.correct_option,
            qs.explanation,
            qr.user_option,
            qr.is_correct,
            TIMESTAMPDIFF(SECOND, qr.create_time, qr.update_time) AS time_spent_seconds
        FROM question_result qr
        JOIN questions qs ON qr.question_id = qs.id
        WHERE qr.quiz_result_id = %s
        ORDER BY qs.id
    """, (result_id,))
    question_details = cursor.fetchall()

    for q in question_details:
        secs = q['time_spent_seconds'] or 0
        q['time_spent_formatted'] = f"{secs // 60}m {secs % 60}s"

    cursor.close()
    conn.close()

    return render_template(
        "result.html",
        result=result,
        questions=question_details,
        formatted_time=formatted_time
    )

@app.route('/attempts/<int:topic_id>')
def past_attempts(topic_id):
    if 'user_id' not in session:
        return redirect('/login')

    user_id = session['user_id']
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

    # Fetch all past quiz attempts by this user for this topic
    cursor.execute("""
        SELECT qr.id AS result_id, qr.score, qr.time_taken, qr.creation_time
        FROM quiz_results qr
        JOIN quizzes q ON qr.quiz_id = q.id
        WHERE qr.user_id = %s AND q.topic_id = %s AND qr.status = 'submitted'
        ORDER BY qr.creation_time DESC
    """, (user_id, topic_id))
    attempts = cursor.fetchall()

    # Fetch topic name
    cursor.execute("SELECT name FROM topics WHERE id = %s", (topic_id,))
    topic = cursor.fetchone()

    all_attempt_data = []

    for attempt in attempts:
        cursor.execute("""
            SELECT 
                qs.question_text,
                qs.option_a, qs.option_b, qs.option_c, qs.option_d,
                qs.correct_option,
                qs.explanation,
                qr.user_option,
                qr.is_correct,
                TIMESTAMPDIFF(SECOND, qr.create_time, qr.update_time) AS time_spent_seconds
            FROM question_result qr
            JOIN questions qs ON qr.question_id = qs.id
            WHERE qr.quiz_result_id = %s
            ORDER BY qs.id
        """, (attempt['result_id'],))
        questions = cursor.fetchall()

        for q in questions:
            secs = q['time_spent_seconds'] or 0
            q['time_spent_formatted'] = f"{secs // 60}m {secs % 60}s"

        attempt['questions'] = questions
        all_attempt_data.append(attempt)

    cursor.close()
    conn.close()

    return render_template('past_attempts.html',
                           topic=topic,
                           attempts=all_attempt_data)

@app.route('/logout')
def logout():
    session.clear()  
    flash('You have been signed out.', 'info')  
    return redirect('/login')  



if __name__ == '__main__':
    app.run(debug=True)