
INSERT INTO interview_rounds (
    application_id,
    round_number,
    round_name,
    interview_date,
    round_status,
    feedback
)
SELECT
    a.application_id,
    v.round_number,
    v.round_name,
    v.interview_date,
    v.round_status,
    v.feedback
FROM (
    VALUES
    ('NST001', 'Google', 'Software Engineer', 1, 'Online Assessment', DATE '2026-11-08', 'Cleared', 'Strong problem-solving skills'),
    ('NST001', 'Google', 'Software Engineer', 2, 'Technical Interview', DATE '2026-11-13', 'Pending', 'Interview scheduled'),

    ('NST004', 'Google', 'Software Engineer', 1, 'Online Assessment', DATE '2026-11-09', 'Cleared', 'Excellent coding performance'),

    ('NST008', 'Microsoft', 'Software Engineer', 1, 'Coding Round', DATE '2026-11-09', 'Cleared', 'Good algorithmic understanding'),
    ('NST008', 'Microsoft', 'Software Engineer', 2, 'Technical Interview', DATE '2026-11-15', 'Pending', 'Interview scheduled'),

    ('NST003', 'Microsoft', 'Software Engineer', 1, 'Coding Round', DATE '2026-11-08', 'Rejected', 'Insufficient test case coverage'),

    ('NST002', 'Amazon', 'SDE Intern', 1, 'Online Assessment', DATE '2026-11-09', 'Cleared', 'Good performance'),
    ('NST002', 'Amazon', 'SDE Intern', 2, 'Technical Interview', DATE '2026-11-16', 'Pending', 'Interview scheduled'),

    ('NST003', 'Infosys', 'Systems Engineer', 1, 'Technical Round', DATE '2026-11-10', 'Cleared', 'Good technical fundamentals'),

    ('NST010', 'Infosys', 'Systems Engineer', 1, 'Technical Round', DATE '2026-11-10', 'Rejected', 'Needs improvement in programming'),

    ('NST007', 'TCS', 'Assistant Systems Engineer', 1, 'Technical Round', DATE '2026-11-10', 'Cleared', 'Good technical knowledge'),

    ('NST011', 'Wipro', 'Project Engineer', 1, 'Coding Round', DATE '2026-11-11', 'Cleared', 'Passed coding assessment'),

    ('NST012', 'Flipkart', 'Frontend Developer', 1, 'Technical Round', DATE '2026-11-11', 'Cleared', 'Strong React fundamentals'),

    ('NST013', 'Razorpay', 'Backend Developer', 1, 'Technical Round', DATE '2026-11-11', 'Rejected', 'Limited backend knowledge'),

    ('NST012', 'Accenture', 'Associate Software Engineer', 1, 'Technical Round', DATE '2026-11-11', 'Cleared', 'Good problem-solving skills')

) AS v(
    usn,
    company_name,
    job_title,
    round_number,
    round_name,
    interview_date,
    round_status,
    feedback
)
JOIN students s
    ON s.usn = v.usn
JOIN companies c
    ON c.company_name = v.company_name
JOIN job_openings j
    ON j.company_id = c.company_id
    AND j.job_title = v.job_title
JOIN applications a
    ON a.student_id = s.student_id
    AND a.job_id = j.job_id;

-- Update the current interview round for each application
UPDATE applications a
SET current_round = (
    SELECT COALESCE(MAX(ir.round_number), 0)
    FROM interview_rounds ir
    WHERE ir.application_id = a.application_id
);

-- Verify the interview records
SELECT
    s.usn,
    s.first_name,
    c.company_name,
    ir.round_name,
    ir.round_status
FROM interview_rounds ir
JOIN applications a ON ir.application_id = a.application_id
JOIN students s ON a.student_id = s.student_id
JOIN job_openings j ON a.job_id = j.job_id
JOIN companies c ON j.company_id = c.company_id
ORDER BY s.usn, c.company_name, ir.round_number;
