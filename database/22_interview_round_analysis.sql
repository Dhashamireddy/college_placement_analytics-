-- Interview Round Analysis

SELECT
    ir.round_name,

    COUNT(ir.interview_id) AS total_interviews,

    COUNT(DISTINCT ir.application_id) AS total_students,

    COUNT(CASE
        WHEN LOWER(ir.round_status) = 'cleared'
        THEN 1
    END) AS students_cleared,

    COUNT(CASE
        WHEN LOWER(ir.round_status) = 'failed'
        THEN 1
    END) AS students_failed,

    ROUND(
        100.0 * COUNT(CASE
            WHEN LOWER(ir.round_status) = 'cleared'
            THEN 1
        END)
        / NULLIF(COUNT(ir.interview_id), 0),
        2
    ) AS selection_percentage

FROM interview_rounds ir

GROUP BY ir.round_name

ORDER BY selection_percentage DESC;