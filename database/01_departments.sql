
CREATE TABLE departments (
    department_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    department_code VARCHAR(20) NOT NULL UNIQUE
);

INSERT INTO departments (department_name, department_code)
VALUES
    ('Computer Science and Engineering', 'CSE'),
    ('Electronics and Communication', 'ECE'),
    ('Artificial Intelligence and Machine Learning', 'AIML'),
    ('Information Science', 'ISE'),
    ('Mechanical Engineering', 'ME');

SELECT * FROM departments;
