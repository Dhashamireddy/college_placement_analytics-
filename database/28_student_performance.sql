
-- 28. CGPA vs Placement Performance

SELECT
    CASE
        WHEN s.cgpa >= 9.0 THEN '9.0 - 10.0'
        WHEN s.cgpa >= 8.0 THEN '8.0 - 8.9'
        WHEN s.cgpa >= 7.0 THEN '7.0 - 7.9'
        WHEN s.cgpa >= 6.0 THEN '6.0 - 6.9'
        ELSE 'Below 6.0'
    END AS cgpa_range,

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

LEFT JOIN applications a
    ON s.student_id = a.student_id

LEFT JOIN offers o
    ON a.application_id = o.application_id

GROUP BY cgpa_range

ORDER BY MIN(s.cgpa) DESC;
