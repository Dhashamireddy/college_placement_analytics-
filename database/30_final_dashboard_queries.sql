
-- 30. Final Placement Analytics Dashboard

-- QUERY 1: Overall Placement Statistics

SELECT
    (SELECT COUNT(*) FROM students) AS total_students,

    (SELECT COUNT(*) FROM companies) AS total_companies,

    (SELECT COUNT(*) FROM job_openings) AS total_job_openings,

    (SELECT COUNT(*) FROM applications) AS total_applications,

    (SELECT COUNT(*)
     FROM offers
     WHERE LOWER(offer_status) = 'accepted'
    ) AS accepted_offers;


-- QUERY 2: Department-wise Placement Summary

SELECT
    d.department_name,

    COUNT(DISTINCT s.student_id) AS total_students,

    COUNT(DISTINCT CASE
        WHEN LOWER(o.offer_status) = 'accepted'
        THEN s.student_id
    END) AS placed_students

FROM departments d

LEFT JOIN students s
    ON d.department_id = s.department_id

LEFT JOIN applications a
    ON s.student_id = a.student_id

LEFT JOIN offers o
    ON a.application_id = o.application_id

GROUP BY d.department_name

ORDER BY placed_students DESC;


-- QUERY 3: Company-wise Hiring Summary

SELECT
    c.company_name,

    COUNT(DISTINCT a.application_id) AS total_applications,

    COUNT(DISTINCT o.offer_id) AS total_offers,

    COUNT(DISTINCT CASE
        WHEN LOWER(o.offer_status) = 'accepted'
        THEN o.offer_id
    END) AS accepted_offers

FROM companies c

LEFT JOIN job_openings j
    ON c.company_id = j.company_id

LEFT JOIN applications a
    ON j.job_id = a.job_id

LEFT JOIN offers o
    ON a.application_id = o.application_id

GROUP BY c.company_id, c.company_name

ORDER BY accepted_offers DESC;


-- QUERY 4: Overall Salary Statistics

SELECT
    COUNT(*) AS total_offers,

    ROUND(AVG(offered_package_lpa), 2) AS average_package_lpa,

    MAX(offered_package_lpa) AS highest_package_lpa,

    MIN(offered_package_lpa) AS lowest_package_lpa

FROM offers;


-- QUERY 5: Application Status Summary

SELECT
    application_status,

    COUNT(*) AS total_applications

FROM applications

GROUP BY application_status

ORDER BY total_applications DESC;
