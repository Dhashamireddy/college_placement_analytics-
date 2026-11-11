
INSERT INTO students (
    usn,
    first_name,
    last_name,
    email,
    phone,
    department_id,
    graduation_year,
    cgpa,
    backlogs,
    enrollment_date
)
SELECT
    v.usn,
    v.first_name,
    v.last_name,
    v.email,
    v.phone,
    d.department_id,
    v.graduation_year,
    v.cgpa,
    v.backlogs,
    v.enrollment_date
FROM (
    VALUES
    ('NST001', 'Aarav', 'Sharma', 'aarav@gmail.com', '9876500001', 'CSE', 2027, 9.10, 0, DATE '2023-08-01'),
    ('NST002', 'Ananya', 'Reddy', 'ananya@gmail.com', '9876500002', 'CSE', 2027, 8.75, 0, DATE '2023-08-01'),
    ('NST003', 'Rahul', 'Verma', 'rahul@gmail.com', '9876500003', 'CSE', 2027, 7.80, 1, DATE '2023-08-01'),
    ('NST004', 'Priya', 'Nair', 'priya@gmail.com', '9876500004', 'CSE', 2027, 9.45, 0, DATE '2023-08-01'),

    ('NST005', 'Karthik', 'Rao', 'karthik@gmail.com', '9876500005', 'ECE', 2027, 8.20, 0, DATE '2023-08-01'),
    ('NST006', 'Sneha', 'Patel', 'sneha@gmail.com', '9876500006', 'ECE', 2027, 7.50, 0, DATE '2023-08-01'),
    ('NST007', 'Arjun', 'Kumar', 'arjun@gmail.com', '9876500007', 'ECE', 2027, 8.90, 0, DATE '2023-08-01'),

    ('NST008', 'Meera', 'Iyer', 'meera@gmail.com', '9876500008', 'AIML', 2027, 9.30, 0, DATE '2023-08-01'),
    ('NST009', 'Rohan', 'Das', 'rohan@gmail.com', '9876500009', 'AIML', 2027, 8.10, 0, DATE '2023-08-01'),
    ('NST010', 'Divya', 'Shetty', 'divya@gmail.com', '9876500010', 'AIML', 2027, 7.20, 2, DATE '2023-08-01'),

    ('NST011', 'Vikram', 'Singh', 'vikram@gmail.com', '9876500011', 'ISE', 2027, 8.60, 0, DATE '2023-08-01'),
    ('NST012', 'Pooja', 'Menon', 'pooja@gmail.com', '9876500012', 'ISE', 2027, 9.00, 0, DATE '2023-08-01'),
    ('NST013', 'Aditya', 'Joshi', 'aditya@gmail.com', '9876500013', 'ISE', 2027, 7.90, 1, DATE '2023-08-01'),

    ('NST014', 'Sanjay', 'Gupta', 'sanjay@gmail.com', '9876500014', 'ME', 2027, 8.00, 0, DATE '2023-08-01'),
    ('NST015', 'Neha', 'Kulkarni', 'neha@gmail.com', '9876500015', 'ME', 2027, 8.70, 0, DATE '2023-08-01')

) AS v(
    usn,
    first_name,
    last_name,
    email,
    phone,
    department_code,
    graduation_year,
    cgpa,
    backlogs,
    enrollment_date
)
JOIN departments d
    ON d.department_code = v.department_code;

SELECT * FROM students ORDER BY student_id;
