
INSERT INTO offers (
    application_id,
    offered_package_lpa,
    offer_date,
    joining_date,
    offer_status
)
SELECT
    a.application_id,
    v.offered_package_lpa,
    v.offer_date,
    v.joining_date,
    v.offer_status
FROM (
    VALUES
    ('NST003', 'Infosys', 'Systems Engineer', 6.50, DATE '2026-11-11', DATE '2027-07-01', 'Offered'),
    ('NST007', 'TCS', 'Assistant Systems Engineer', 7.00, DATE '2026-11-11', DATE '2027-07-01', 'Accepted'),
    ('NST011', 'Wipro', 'Project Engineer', 7.50, DATE '2026-11-11', DATE '2027-07-01', 'Offered'),
    ('NST012', 'Flipkart', 'Frontend Developer', 18.00, DATE '2026-11-11', DATE '2027-07-01', 'Accepted'),
    ('NST012', 'Accenture', 'Associate Software Engineer', 8.50, DATE '2026-11-11', DATE '2027-07-01', 'Offered')

) AS v(
    usn,
    company_name,
    job_title,
    offered_package_lpa,
    offer_date,
    joining_date,
    offer_status
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

-- Mark applications with offers as Selected
UPDATE applications
SET application_status = 'Selected'
WHERE application_id IN (
    SELECT application_id
    FROM offers
);

-- Verify offers
SELECT
    s.usn,
    s.first_name,
    c.company_name,
    o.offered_package_lpa,
    o.offer_status
FROM offers o
JOIN applications a ON o.application_id = a.application_id
JOIN students s ON a.student_id = s.student_id
JOIN job_openings j ON a.job_id = j.job_id
JOIN companies c ON j.company_id = c.company_id
ORDER BY s.usn;
