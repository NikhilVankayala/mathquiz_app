-- Add this to your schema.sql or a new test_data.sql
INSERT INTO topics (id, name, grade_level) VALUES
(1, 'Algebra Basics', 10),
(2, 'Geometry Fundamentals', 10),
(3, 'Calculus Introduction', 11),
(10, 'Advanced Algebra', 10); -- Ensure topic_id 10 exists if used in tests
-- You might also want to add a test user here if test_signup_duplicate_email relies on it
INSERT INTO users (id, name, username, email, password, grade_level, phone_number) VALUES
(1, 'Test User', 'testuser', 'nikhil.vankayala7@gmail.com', 'hashed_password', 10, '1234567890');