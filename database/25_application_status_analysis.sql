
-- Application Status Analysis

SELECT
    COUNT(*) AS total_applications,

    COUNT(CASE
        WHEN LOWER(application_status) = 'under review'
        THEN 1
    END) AS under_review,

    COUNT(CASE
        WHEN LOWER(application_status) = 'shortlisted'
        THEN 1
    END) AS shortlisted,

    COUNT(CASE
        WHEN LOWER(application_status) = 'rejected'
        THEN 1
    END) AS rejected,

    ROUND(
        100.0 * COUNT(CASE
            WHEN LOWER(application_status) = 'shortlisted'
            THEN 1
        END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS success_percentage

FROM applications;
