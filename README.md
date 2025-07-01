# MathQuiz App 🎓🧮

**MathQuiz App** is a web-based platform built with Flask and MySQL that delivers dynamic, topic-based math quizzes for high school students (Grades 9–12). It features user login, topic selection, time-limited questions, a performance dashboard, quiz history, and Docker support for easy deployment.

---

## 🚀 Features

- 🔐 **User Authentication**: Secure login and signup with hashed passwords.
- 📚 **Topic-Based Quizzes**: Choose from math topics tailored to your grade level.
- ⏱ **Timed Questions**: Each quiz question has its own countdown timer.
- 🎯 **Final Cumulative Quiz**: Reinforces concepts by re-testing past mistakes.
- 📊 **Dashboard & Past Attempts**: Visualize progress and review previous quizzes.
- 🧪 **Question Types**: Mix of multiple-choice and true/false questions with theoretical and calculation content.
- 🔁 **Randomization**: Questions are randomized and modified slightly each time.
- 🐳 **Docker Support**: Run the app with a single Docker command.
- ✅ **Test Coverage**: Includes `pytest` unit tests with mock data.

---

## 🛠️ Tech Stack

- **Backend**: Python (Flask)
- **Frontend**: HTML5, CSS3, Vanilla JavaScript
- **Database**: MySQL
- **Testing**: `pytest`, `.coverage`
- **Containerization**: Docker
- **Authentication**: Flask sessions + `werkzeug.security`

---

## 📁 Project Structure

mathquiz_app/
│
├── app.py # Main Flask app
├── db.py # Database connection logic (inside /models)
├── models/
│ └── pycache/
│
├── templates/ # HTML Templates
│ ├── dashboard.html
│ ├── home.html
│ ├── login.html
│ ├── past_attempts.html
│ ├── quiz_question.html
│ ├── result.html
│ ├── signup.html
│ └── topics.html
│
├── static/ # Static assets (CSS, JS, images)
│
├── schema.sql # SQL schema for database structure
├── seed_data.sql # Initial data for the database
├── test_data.sql # Additional test data
│
├── test_app.py # Main unit test file
├── requirements.txt # Python dependencies
├── README.md # Project documentation
├── .dockerignore
├── Dockerfile
├── .gitignore
├── .coverage
├── .github/workflows/
│ └── python-app.yml # GitHub Actions CI setup

yaml
Copy
Edit

---

## 🧪 Running the App Locally

### 1. Clone the Repo

```bash
git clone https://github.com/your-username/mathquiz_app.git
cd mathquiz_app
2. Create a Virtual Environment
bash
Copy
Edit
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
3. Install Requirements
bash
Copy
Edit
pip install -r requirements.txt
4. Set Up MySQL
bash
Copy
Edit
mysql -u root -p < schema.sql
mysql -u root -p < seed_data.sql
5. Run the App
bash
Copy
Edit
flask run
6. Run Tests
bash
Copy
Edit
pytest --cov
🐳 Docker Instructions
To build and run the app using Docker:

bash
Copy
Edit
docker build -t mathquiz_app .
docker run -p 5000:5000 mathquiz_app
Make sure your container or host is connected to a MySQL instance and the environment variables are set accordingly.

✅ Future Improvements
✅ Admin panel for managing users and quiz content

📈 Leaderboards and achievement system

📱 Mobile-responsive design

📄 Export quiz reports to PDF

🌐 API endpoints for external integrations

