
-- Skills Analysis

SELECT
    s.skill_name,
    s.skill_category,

    COUNT(DISTINCT ss.student_id) AS total_students,

    ROUND(
        100.0 * COUNT(DISTINCT ss.student_id)
        / NULLIF((SELECT COUNT(*) FROM students), 0),
        2
    ) AS percentage_of_students

FROM skills s

LEFT JOIN student_skills ss
    ON s.skill_id = ss.skill_id

GROUP BY
    s.skill_id,
    s.skill_name,
    s.skill_category

ORDER BY total_students DESC;
