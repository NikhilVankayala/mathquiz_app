from flask import Flask, render_template, request, redirect, session, flash
from werkzeug.security import generate_password_hash, check_password_hash
from models.db import get_connection

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





if __name__ == '__main__':
    app.run(debug=True)