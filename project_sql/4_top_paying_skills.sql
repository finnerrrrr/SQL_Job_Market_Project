/* 
Question: What are the top skills based on salary 
- look at the average salary associated with each skill for Data Analyst positions
- focus on roles with specified salaries, regardless of location
- focus on all job postings 
- why? it reveals how different skills impact salary levels for Data Analyst and helps identify
    the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    round(avg(salary_year_avg),0) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Business Analyst' and
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
limit 25

