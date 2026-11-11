
INSERT INTO applications (
    student_id,
    job_id,
    application_date,
    application_status
)
SELECT
    s.student_id,
    j.job_id,
    v.application_date,
    v.application_status
FROM (
    VALUES
    ('NST001', 'Google', 'Software Engineer', DATE '2026-11-01', 'Shortlisted'),
    ('NST002', 'Google', 'Software Engineer', DATE '2026-11-02', 'Applied'),
    ('NST004', 'Google', 'Software Engineer', DATE '2026-11-03', 'Shortlisted'),

    ('NST001', 'Microsoft', 'Software Engineer', DATE '2026-11-04', 'Applied'),
    ('NST003', 'Microsoft', 'Software Engineer', DATE '2026-11-04', 'Rejected'),
    ('NST008', 'Microsoft', 'Software Engineer', DATE '2026-11-05', 'Shortlisted'),

    ('NST002', 'Amazon', 'SDE Intern', DATE '2026-11-05', 'Shortlisted'),
    ('NST005', 'Amazon', 'SDE Intern', DATE '2026-11-06', 'Applied'),
    ('NST009', 'Amazon', 'SDE Intern', DATE '2026-11-06', 'Applied'),

    ('NST003', 'Infosys', 'Systems Engineer', DATE '2026-11-07', 'Shortlisted'),
    ('NST006', 'Infosys', 'Systems Engineer', DATE '2026-11-07', 'Applied'),
    ('NST010', 'Infosys', 'Systems Engineer', DATE '2026-11-08', 'Rejected'),

    ('NST005', 'TCS', 'Assistant Systems Engineer', DATE '2026-11-08', 'Applied'),
    ('NST007', 'TCS', 'Assistant Systems Engineer', DATE '2026-11-09', 'Shortlisted'),

    ('NST006', 'Wipro', 'Project Engineer', DATE '2026-11-09', 'Applied'),
    ('NST011', 'Wipro', 'Project Engineer', DATE '2026-11-10', 'Shortlisted'),

    ('NST008', 'Flipkart', 'Frontend Developer', DATE '2026-11-10', 'Applied'),
    ('NST012', 'Flipkart', 'Frontend Developer', DATE '2026-11-10', 'Shortlisted'),

    ('NST009', 'Razorpay', 'Backend Developer', DATE '2026-11-11', 'Applied'),
    ('NST013', 'Razorpay', 'Backend Developer', DATE '2026-11-11', 'Rejected'),

    ('NST011', 'Swiggy', 'Data Analyst', DATE '2026-11-11', 'Applied'),
    ('NST014', 'Swiggy', 'Data Analyst', DATE '2026-11-11', 'Applied'),

    ('NST012', 'Accenture', 'Associate Software Engineer', DATE '2026-11-11', 'Shortlisted'),
    ('NST015', 'Accenture', 'Associate Software Engineer', DATE '2026-11-11', 'Applied')

) AS v(usn, company_name, job_title, application_date, application_status)

JOIN students s
    ON s.usn = v.usn

JOIN companies c
    ON c.company_name = v.company_name

JOIN job_openings j
    ON j.company_id = c.company_id
    AND j.job_title = v.job_title;

SELECT
    a.application_id,
    s.usn,
    s.first_name,
    c.company_name,
    j.job_title,
    a.application_status
FROM applications a
JOIN students s
    ON a.student_id = s.student_id
JOIN job_openings j
    ON a.job_id = j.job_id
JOIN companies c
    ON j.company_id = c.company_id
ORDER BY a.application_id;
