-- Company-wise Hiring Analysis

SELECT
    c.company_name,

    COUNT(DISTINCT j.job_id) AS total_job_openings,

    COUNT(DISTINCT a.student_id) AS total_applicants,

    COUNT(DISTINCT o.offer_id) AS total_offers,

    COUNT(DISTINCT CASE
        WHEN LOWER(o.offer_status) = 'accepted'
        THEN o.offer_id
    END) AS accepted_offers,

    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN LOWER(o.offer_status) = 'accepted'
            THEN o.offer_id
        END)
        / NULLIF(COUNT(DISTINCT a.student_id), 0),
        2
    ) AS hiring_success_percentage

FROM companies c

LEFT JOIN job_openings j
    ON c.company_id = j.company_id

LEFT JOIN applications a
    ON j.job_id = a.job_id

LEFT JOIN offers o
    ON a.application_id = o.application_id

GROUP BY c.company_id, c.company_name

ORDER BY accepted_offers DESC;