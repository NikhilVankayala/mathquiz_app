from flask import Flask, render_template, request, redirect, session, flash, url_for
from werkzeug.security import generate_password_hash, check_password_hash
from models.db import get_connection
from datetime import datetime

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
    
    cursor.execute('SELECT * FROM topics where grade_level = %s',(grade,))
    topics = cursor.fetchall()

    cursor.execute("""
        SELECT DISTINCT q.topic_id
        FROM quiz_results qr
        JOIN quizzes q ON qr.quiz_id = q.id
        WHERE qr.user_id = %s AND qr.status = 'submitted'
    """, (user_id,))
    attempted_topic_ids = {row['topic_id'] for row in cursor.fetchall()}

    cursor.close()
    conn.close()

    return render_template('topics.html', topics=topics, grade=grade, attempted_topic_ids=attempted_topic_ids)
@app.route('/quiz/<int:topic_id>', methods=['GET', 'POST'])
def quiz(topic_id):
    if 'user_id' not in session:
        return redirect('/login')

    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

    user_id = session['user_id']
    q_index = int(request.args.get('q', 0))

    # Get or create the quiz
    cursor.execute("SELECT id FROM quizzes WHERE topic_id = %s", (topic_id,))
    quiz = cursor.fetchone()

    if not quiz:
        grade_level = session['grade_level']
        cursor.execute("""
            INSERT INTO quizzes (topic_id, grade_level, time_limit)
            VALUES (%s, %s, %s)
        """, (topic_id, grade_level, 600))  # 600 is total quiz time if you want it globally
        conn.commit()
        quiz_id = cursor.lastrowid
    else:
        quiz_id = quiz['id']

    # Get or create the quiz result
    quiz_result_id = session.get('quiz_result_id')
    if not quiz_result_id:
        cursor.execute("""
            INSERT INTO quiz_results (user_id, quiz_id, status)
            VALUES (%s, %s, 'in_progress')
        """, (user_id, quiz_id))
        conn.commit()
        quiz_result_id = cursor.lastrowid
        session['quiz_result_id'] = quiz_result_id

        cursor.execute("""
            UPDATE quiz_results
            SET creation_time = NOW()
            WHERE id = %s
        """, (quiz_result_id,))
        conn.commit()

    # Fetch all questions for the topic
    cursor.execute("SELECT * FROM questions WHERE topic_id = %s", (topic_id,))
    questions = cursor.fetchall()

    if q_index >= len(questions):
        flash("You've completed all questions!", "info")
        return redirect('/dashboard')

    current_question = questions[q_index]
    question_id = current_question['id']

    # Restore user selection if any
    cursor.execute("""
        SELECT user_option FROM question_result
        WHERE quiz_result_id = %s AND question_id = %s
    """, (quiz_result_id, question_id))
    existing_answer = cursor.fetchone()
    current_question['user_option'] = existing_answer['user_option'] if existing_answer else None

    # Per-question time tracking
    key = f"question_{question_id}_start"
    if key not in session:
        session[key] = datetime.utcnow().isoformat()

    start_time = datetime.fromisoformat(session[key])
    elapsed = (datetime.utcnow() - start_time).total_seconds()
    time_left = max(0, 180 - int(elapsed))  # 3 minutes per question

    # Handle form submission
    if request.method == 'POST':
        selected = request.form.get('option')
        is_correct = selected == current_question['correct_option'] if selected else False

        cursor.execute("""
            SELECT id FROM question_result
            WHERE quiz_result_id = %s AND question_id = %s
        """, (quiz_result_id, question_id))
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
            """, (quiz_result_id, question_id, selected, is_correct))
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
                SET score = %s,
                    status = 'submitted',
                    time_taken = TIMESTAMPDIFF(SECOND, creation_time, NOW())
                WHERE id = %s
            """, (score, quiz_result_id))
            conn.commit()

            session.pop('quiz_result_id', None)
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



if __name__ == '__main__':
    app.run(debug=True)