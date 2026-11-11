
-- 29. Company Salary Comparison

SELECT
    c.company_name,

    COUNT(o.offer_id) AS total_offers,

    ROUND(AVG(o.offered_package_lpa), 2) AS average_package_lpa,

    MAX(o.offered_package_lpa) AS highest_package_lpa,

    MIN(o.offered_package_lpa) AS lowest_package_lpa,

    COUNT(CASE
        WHEN LOWER(o.offer_status) = 'accepted'
        THEN 1
    END) AS accepted_offers

FROM companies c

JOIN job_openings j
    ON c.company_id = j.company_id

JOIN applications a
    ON j.job_id = a.job_id

JOIN offers o
    ON a.application_id = o.application_id

GROUP BY
    c.company_id,
    c.company_name

ORDER BY average_package_lpa DESC;
