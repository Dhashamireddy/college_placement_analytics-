
-- 27. Department and Graduation Year Placement Trends

SELECT
    d.department_name,
    s.graduation_year,

    COUNT(DISTINCT s.student_id) AS total_students,

    COUNT(DISTINCT CASE
        WHEN LOWER(o.offer_status) = 'accepted'
        THEN s.student_id
    END) AS placed_students,

    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN LOWER(o.offer_status) = 'accepted'
            THEN s.student_id
        END) / NULLIF(COUNT(DISTINCT s.student_id), 0),
        2
    ) AS placement_percentage

FROM students s

JOIN departments d
    ON s.department_id = d.department_id

LEFT JOIN applications a
    ON s.student_id = a.student_id

LEFT JOIN offers o
    ON a.application_id = o.application_id

GROUP BY
    d.department_name,
    s.graduation_year

ORDER BY
    s.graduation_year,
    placement_percentage DESC;
