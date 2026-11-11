
INSERT INTO job_openings (
    company_id,
    job_title,
    job_description,
    job_location,
    employment_type,
    minimum_cgpa,
    maximum_backlogs,
    package_lpa,
    application_deadline,
    job_status
)
SELECT
    c.company_id,
    v.job_title,
    v.job_description,
    v.job_location,
    v.employment_type,
    v.minimum_cgpa,
    v.maximum_backlogs,
    v.package_lpa,
    v.application_deadline,
    v.job_status
FROM (
    VALUES
    ('Google', 'Software Engineer', 'Backend and distributed systems development', 'Bengaluru', 'Full-time', 8.00, 0, 28.00, DATE '2026-12-15', 'Open'),
    ('Microsoft', 'Software Engineer', 'Cloud and application development', 'Hyderabad', 'Full-time', 7.50, 0, 24.00, DATE '2026-12-20', 'Open'),
    ('Amazon', 'SDE Intern', 'Software development and problem solving', 'Bengaluru', 'Internship', 7.00, 1, 12.00, DATE '2026-12-10', 'Open'),
    ('Infosys', 'Systems Engineer', 'Enterprise software development', 'Bengaluru', 'Full-time', 6.00, 2, 6.50, DATE '2026-12-25', 'Open'),
    ('TCS', 'Assistant Systems Engineer', 'Application development and maintenance', 'Mumbai', 'Full-time', 6.00, 2, 7.00, DATE '2026-12-22', 'Open'),
    ('Wipro', 'Project Engineer', 'Software engineering and testing', 'Bengaluru', 'Full-time', 6.50, 1, 7.50, DATE '2026-12-18', 'Open'),
    ('Flipkart', 'Frontend Developer', 'React-based web application development', 'Bengaluru', 'Full-time', 7.50, 0, 18.00, DATE '2026-12-12', 'Open'),
    ('Razorpay', 'Backend Developer', 'Payment systems and API development', 'Bengaluru', 'Full-time', 8.00, 0, 20.00, DATE '2026-12-19', 'Open'),
    ('Swiggy', 'Data Analyst', 'Data analysis and business intelligence', 'Bengaluru', 'Full-time', 7.00, 1, 14.00, DATE '2026-12-17', 'Open'),
    ('Accenture', 'Associate Software Engineer', 'Full-stack application development', 'Bengaluru', 'Full-time', 6.00, 2, 8.00, DATE '2026-12-28', 'Open')
) AS v(
    company_name,
    job_title,
    job_description,
    job_location,
    employment_type,
    minimum_cgpa,
    maximum_backlogs,
    package_lpa,
    application_deadline,
    job_status
)
JOIN companies c
    ON c.company_name = v.company_name;

SELECT
    j.job_id,
    c.company_name,
    j.job_title,
    j.package_lpa,
    j.minimum_cgpa,
    j.job_status
FROM job_openings j
JOIN companies c
    ON j.company_id = c.company_id
ORDER BY j.job_id;
