# MathQuiz App
 
A Flask and MySQL web app that gives high school students (grades 9–12) timed, topic-based math quizzes. Students sign up, pick a topic for their grade, answer timed multiple-choice and true/false questions, and review their scores and past attempts.
 
The app is deployed on a serverless AWS stack (Lambda, API Gateway, Aurora Serverless v2, RDS Proxy), with a CI/CD pipeline that tests, builds, and deploys every push to `main`.
 
## Features
 
- **User accounts:** signup and login, with passwords stored as salted hashes (Werkzeug).
- **Topic-based quizzes:** math topics organized by grade level.
- **Timed questions:** each question has a countdown timer.
- **Cumulative quizzes:** grade-wide quizzes that draw on questions across topics.
- **Dashboard and past attempts:** each attempt's score, time taken, and answers are saved for review.
- **Question types:** multiple choice and true/false, with LaTeX-rendered math and explanations.
- **Tests:** pytest suite run against a MySQL test database on every build.
## Tech Stack
 
| Layer | Technology |
|---|---|
| Backend | Python, Flask |
| Frontend | HTML (Jinja2 templates), CSS, vanilla JavaScript |
| Database | MySQL (Aurora Serverless v2, MySQL-compatible, on AWS) |
| Auth | Flask sessions, `werkzeug.security` |
| Testing | pytest, coverage |
| Hosting | AWS Lambda (container image), API Gateway (HTTP API) |
| Infrastructure as code | AWS CloudFormation |
| CI/CD | AWS CodePipeline, CodeBuild |
 
## Application Architecture
 
```
Browser
   │
   ▼
API Gateway (HTTP API)
   │
   ▼
Lambda (Flask app in a container: Lambda Web Adapter + gunicorn)
   │                         │
   │ private VPC             │ VPC endpoint
   ▼                         ▼
RDS Proxy               Secrets Manager
   │                    (DB credentials, Flask secret key)
   ▼
Aurora Serverless v2 (MySQL)
```
 
- **Lambda** runs the Flask app as a container image stored in **ECR**. The AWS Lambda Web Adapter lets the unmodified Flask app run behind gunicorn.
- **API Gateway** provides the public HTTPS endpoint.
- **Aurora Serverless v2** holds the data and scales capacity with load.
- **RDS Proxy** pools database connections so many short-lived Lambda instances don't exhaust the database.
- **VPC:** Lambda, the proxy, and Aurora run in private subnets with no internet access. A **Secrets Manager VPC interface endpoint** lets Lambda fetch secrets privately.
- **Secrets Manager** stores the database credentials and Flask's session-signing key. The app fetches them at startup, so no secrets live in code or configuration.
- **Database setup:** on the first request after a deploy, the app creates the schema and loads seed data if the database is empty (`init_db()` in `app.py`). This step is idempotent and does nothing once the data exists.
## CI/CD Pipeline
 
Every push to `main` runs through CodePipeline:
 
1. **Source:** pulls the repo from GitHub through a CodeConnections (CodeStar) connection.
2. **Build (CodeBuild, `buildspec.yml`):** runs pytest against a temporary MySQL database, then builds the image from `Dockerfile.lambda` and pushes it to ECR.
3. **Deploy (CloudFormation):** updates the `mathquiz-app` stack from `infra/template.yaml` with the new image.
The pipeline itself is defined in `infra/pipeline.yaml` and deployed once as the `mathquiz-pipeline` stack.
 
## Project Structure
 
```
mathquiz_app/
├── infra/
│   ├── pipeline.yaml       # CloudFormation: CodePipeline, CodeBuild, ECR, IAM
│   └── template.yaml       # CloudFormation: VPC, Aurora, RDS Proxy, Lambda, API Gateway
├── models/
│   └── db.py               # MySQL connection helper (reads DB settings from env vars)
├── static/
│   └── style.css
├── templates/              # Jinja2 HTML templates
│   ├── dashboard.html
│   ├── home.html
│   ├── login.html
│   ├── past_attempts.html
│   ├── quiz_question.html
│   ├── result.html
│   ├── signup.html
│   └── topics.html
├── app.py                  # Flask app: routes, auth, quiz logic, DB setup
├── buildspec.yml           # CodeBuild steps: test, build, push image
├── Dockerfile.lambda       # Container image for AWS Lambda
├── requirements.txt        # Python dependencies
├── schema.sql              # Database schema
├── seed_data.sql           # Topics, quizzes, and questions
├── test_app.py             # pytest tests
├── test_data.sql           # Test fixtures
├── .dockerignore
├── .gitignore
└── README.md
```
 
## Running Locally
 
### 1. Clone the repository
 
```bash
git clone https://github.com/NikhilVankayala/mathquiz_app.git
cd mathquiz_app
```
 
### 2. Create a virtual environment and install dependencies
 
```bash
python -m venv venv
source venv/bin/activate        # Windows: venv\Scripts\activate
pip install -r requirements.txt
```
 
### 3. Set up MySQL
 
With MySQL installed and running:
 
```bash
mysql -u root -p -e "CREATE DATABASE mathquiz_app"
mysql -u root -p mathquiz_app < schema.sql
mysql -u root -p mathquiz_app < seed_data.sql
```
 
Locally the app doesn't set up the database automatically. That only happens on AWS.
 
### 4. Configure the connection
 
`models/db.py` reads the connection settings from environment variables:
 
```bash
export DB_HOST=localhost
export DB_USER=root
export DB_PASSWORD=your_password
export DB_NAME=mathquiz_app
export FLASK_SECRET_KEY=any-local-dev-value
```
 
### 5. Run the app
 
```bash
flask run
```
 
Open http://127.0.0.1:5000/.
 
### 6. Run the tests
 
```bash
pytest --cov --cov-report=html
```
 
The coverage report is written to `htmlcov/`.
 
## Deploying to AWS
 
1. Deploy the pipeline stack once from `infra/pipeline.yaml` as `mathquiz-pipeline`, supplying the parameters it defines.
2. In the AWS console, approve the GitHub connection under **Developer Tools → Settings → Connections**.
3. Push to `main`. The pipeline tests, builds, and deploys the `mathquiz-app` stack.
4. Get the app URL:
```bash
   aws cloudformation describe-stacks --stack-name mathquiz-app --region us-west-2 \
     --query "Stacks[0].Outputs[?OutputKey=='ApiUrl'].OutputValue" --output text
```
 
The first request after a deploy is slower while the database is set up.
 
**Cost note:** Aurora Serverless v2 and RDS Proxy bill by the hour. To pause costs, delete the `mathquiz-app` stack and re-run the pipeline when you need the app again (about 15 minutes).
 
## Future Improvements
 
- Admin panel for managing users, topics, and questions
- Leaderboards and achievements
- Mobile-responsive layout
- PDF export of quiz reports
- Schema migrations with a migration tool instead of raw SQL files
- A database lock around first-run setup to rule out concurrent seeding
 
