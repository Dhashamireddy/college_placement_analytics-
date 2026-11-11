-- Top Performing Students Analysis

SELECT
    s.student_id,
    s.student_name,
    d.department_name,

    COUNT(DISTINCT a.application_id) AS total_applications,

    COUNT(DISTINCT o.offer_id) AS total_offers,

    COUNT(DISTINCT CASE
        WHEN LOWER(o.offer_status) = 'accepted'
        THEN o.offer_id
    END) AS accepted_offers,

    CASE
        WHEN COUNT(DISTINCT CASE
            WHEN LOWER(o.offer_status) = 'accepted'
            THEN o.offer_id
        END) > 0
        THEN 'Placed'
        ELSE 'Not Placed'
    END AS placement_status

FROM students s

LEFT JOIN departments d
    ON s.department_id = d.department_id

LEFT JOIN applications a
    ON s.student_id = a.student_id

LEFT JOIN offers o
    ON a.application_id = o.application_id

GROUP BY
    s.student_id,
    s.student_name,
    d.department_name

ORDER BY
    accepted_offers DESC,
    total_offers DESC,
    total_applications DESC;