
-- Job Opening Performance Analysis

SELECT
    j.job_id,
    c.company_name,

    COUNT(DISTINCT a.application_id) AS total_applications,

    COUNT(DISTINCT a.student_id) AS total_applicants,

    COUNT(DISTINCT o.offer_id) AS total_offers,

    COUNT(DISTINCT CASE
        WHEN LOWER(o.offer_status) = 'accepted'
        THEN o.offer_id
    END) AS accepted_offers,

    ROUND(
        100.0 * COUNT(DISTINCT o.offer_id)
        / NULLIF(COUNT(DISTINCT a.application_id), 0),
        2
    ) AS application_to_offer_percentage

FROM job_openings j

JOIN companies c
    ON j.company_id = c.company_id

LEFT JOIN applications a
    ON j.job_id = a.job_id

LEFT JOIN offers o
    ON a.application_id = o.application_id

GROUP BY
    j.job_id,
    c.company_name

ORDER BY total_applications DESC;
