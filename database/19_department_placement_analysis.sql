
-- Department-wise Placement Analysis

WITH department_students AS (
    SELECT
        department_id,
        COUNT(*) AS total_students
    FROM students
    GROUP BY department_id
),

department_applicants AS (
    SELECT
        s.department_id,
        COUNT(DISTINCT a.student_id) AS total_applicants
    FROM students s
    JOIN applications a
        ON s.student_id = a.student_id
    GROUP BY s.department_id
),

department_offers AS (
    SELECT
        s.department_id,
        COUNT(o.offer_id) AS total_offers,
        COUNT(DISTINCT CASE
            WHEN o.offer_status = 'Accepted'
            THEN s.student_id
        END) AS placed_students
    FROM students s
    JOIN applications a
        ON s.student_id = a.student_id
    JOIN offers o
        ON a.application_id = o.application_id
    GROUP BY s.department_id
)

SELECT
    d.department_name,
    COALESCE(ds.total_students, 0) AS total_students,
    COALESCE(da.total_applicants, 0) AS total_applicants,
    COALESCE(do.total_offers, 0) AS total_offers,
    COALESCE(do.placed_students, 0) AS placed_students,

    ROUND(
        100.0 * COALESCE(do.placed_students, 0)
        / NULLIF(ds.total_students, 0),
        2
    ) AS placement_percentage

FROM departments d

LEFT JOIN department_students ds
    ON d.department_id = ds.department_id

LEFT JOIN department_applicants da
    ON d.department_id = da.department_id

LEFT JOIN department_offers do
    ON d.department_id = do.department_id

ORDER BY placement_percentage DESC;
