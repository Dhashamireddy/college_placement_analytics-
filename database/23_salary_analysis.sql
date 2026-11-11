-- Offer and Salary Analysis

SELECT
    c.company_name,

    COUNT(o.offer_id) AS total_offers,

    ROUND(AVG(o.salary), 2) AS average_salary,

    MAX(o.salary) AS highest_salary,

    MIN(o.salary) AS lowest_salary

FROM offers o

JOIN applications a
    ON o.application_id = a.application_id

JOIN job_openings j
    ON a.job_id = j.job_id

JOIN companies c
    ON j.company_id = c.company_id

GROUP BY
    c.company_id,
    c.company_name

ORDER BY average_salary DESC;