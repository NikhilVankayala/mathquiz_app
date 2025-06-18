CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    username VARCHAR(100) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    grade_level INT CHECK (grade_level BETWEEN 9 AND 12),
    signup_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE topics (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    grade_level INT CHECK (grade_level BETWEEN 9 AND 12)
);

CREATE TABLE questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    topic_id INT NOT NULL,
    question_text TEXT NOT NULL,
    option_a VARCHAR(255),
    option_b VARCHAR(255),
    option_c VARCHAR(255),
    option_d VARCHAR(255),
    correct_option CHAR(1),
    question_type ENUM('MCQ', 'TF') DEFAULT 'MCQ',
    explanation TEXT,
    FOREIGN KEY (topic_id) REFERENCES topics(id)
);

-- If cumulative, topic_id will be NULL
CREATE TABLE quizzes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    topic_id INT,
    is_cumulative BOOLEAN DEFAULT FALSE,
    grade_level INT,
    time_limit_seconds INT,
    FOREIGN KEY (topic_id) REFERENCES topics(id)
);

CREATE TABLE quiz_results (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    topic_id INT,
    quiz_id INT,
    score INT,
    time_taken_seconds INT,
    taken_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id)
);

CREATE TABLE user_answers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    quiz_result_id INT NOT NULL,
    question_id INT NOT NULL,
    user_answer CHAR(1),
    is_correct BOOLEAN,
    FOREIGN KEY (quiz_result_id) REFERENCES quiz_results(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);