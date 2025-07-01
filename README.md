MathQuiz App 🎓🧮
MathQuiz App is a dynamic, web-based platform designed with Flask and MySQL, offering engaging, topic-based math quizzes for high school students (Grades 9–12). It provides a comprehensive learning experience with features like secure user authentication, interactive timed questions, a personalized performance dashboard, and full quiz history. Built with modern web technologies and Docker support, it ensures easy deployment and a smooth user experience.

✨ Features
. 🔐 User Authentication: Secure login and signup processes with hashed passwords for data protection.

. 📚 Topic-Based Quizzes: Access a variety of math topics specifically tailored for high school grade levels.

. ⏱ Timed Questions: Each question comes with a countdown timer to enhance focus and challenge.

. 🎯 Final Cumulative Quiz: A unique feature that re-tests concepts based on past mistakes, reinforcing learning.

. 📊 Dashboard & Past Attempts: Track your progress with a personalized dashboard and review detailed history of all your quiz attempts.

. 🧪 Diverse Question Types: Engage with a mix of multiple-choice and true/false questions, covering both theoretical concepts and calculation-based problems.

. 🐳 Docker Support: Streamlined deployment with Docker, allowing you to run the entire application with a single command.

. ✅ Robust Test Coverage: Includes pytest unit tests with mock data to ensure application reliability and stability.

🛠️ Tech Stack
Backend: Python (Flask)

Frontend: HTML5, CSS3, Vanilla JavaScript

Database: MySQL

Testing: 'pytest', 'coverage.py'

Containerization: Docker

Authentication: Flask sessions + werkzeug.security

```
📁 Project Structure
mathquiz_app/
│
├── .github/                  # GitHub Actions workflows
│   └── workflows/
│       └── python-app.yml    # CI/CD pipeline for Python tests
├── models/                   # Database models and connection logic
│   ├── db.py                 # MySQL database connection
│   └── __pycache__/          # Python bytecode cache
├── static/                   # Static assets (CSS, JS, images)
├── templates/                # HTML Jinja2 templates
│   ├── dashboard.html
│   ├── home.html
│   ├── login.html
│   ├── past_attempts.html
│   ├── quiz_question.html
│   ├── result.html
│   ├── signup.html
│   └── topics.html
├── venv/                     # Python virtual environment
├── .coverage                 # Coverage report data
├── .dockerignore             # Files to ignore in Docker build context
├── .gitignore                # Files/directories to ignore in Git
├── app.py                    # Main Flask application
├── Dockerfile                # Docker build instructions
├── README.md                 # Project documentation (this file)
├── requirements.txt          # Python project dependencies
├── schema.sql                # SQL script for database schema
├── seed_data.sql             # SQL script for initial application data
├── test_app.py               # Pytest unit tests for the application
├── test_data.sql             # SQL script for additional test-specific data
└── __pycache__/              # Python bytecode cache
```
🚀 Getting Started
Follow these steps to set up and run the MathQuiz App locally.

1. Clone the Repository
```
git clone [https://github.com/your-username/mathquiz_app.git](https://github.com/your-username/mathquiz_app.git)
cd mathquiz_app
```
2. Create a Virtual Environment
It's recommended to use a virtual environment to manage project dependencies.
```
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```
3. Install Requirements
Install all necessary Python packages.
```
pip install -r requirements.txt
```
4. Set Up MySQL Database
Ensure you have MySQL installed and running. Then, create the database schema and populate it with initial data.
```
# Connect to MySQL as root and run schema and seed data
mysql -u root -p < schema.sql
mysql -u root -p < seed_data.sql
# If you have test_data.sql for local testing, you might run it here too:
# mysql -u root -p < test_data.sql
```
5. Run the Application
Start the Flask development server.
```
flask run
```
The app will typically be accessible at http://127.0.0.1:5000/.

6. Run Tests
To run the unit tests and generate a coverage report:
```
pytest --cov
```
This will execute all tests defined in test_app.py and generate a coverage report in the htmlcov/ directory.

🐳 Docker Instructions
To build and run the application using Docker:
```
docker build -t mathquiz_app .
docker run -p 5000:5000 mathquiz_app
```
Note: When running with Docker, ensure your container or host is connected to a MySQL instance and that the necessary environment variables (e.g., DB_HOST, DB_USER, DB_PASSWORD, DB_NAME) are set correctly for the application to connect to the database.

✅ Future Improvements
. Admin Panel: Develop an administrative interface for managing users, quizzes, and question content.

. Leaderboards & Achievements: Implement a system to track and display user performance, fostering friendly competition.

. Mobile-Responsive Design: Enhance the UI/UX for seamless access and optimal display on various mobile devices.

. Export Quiz Reports: Add functionality to export detailed quiz performance reports to PDF format.

. API Endpoints: Create RESTful API endpoints for external integrations and data access.

