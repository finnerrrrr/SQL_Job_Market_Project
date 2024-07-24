/* 
Question: What are the top paying Business Analyst Jobs?
- identify the top 10 highest-paying Business Analyst roles that are available remotely.
- focuses on jobs with specified salaries (remove nulls)
-  why? highlight the top-paying opportnuties for Business Analysts, offering insights into what employers look for in these roles
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
FROM
    job_postings_fact
LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Business Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10