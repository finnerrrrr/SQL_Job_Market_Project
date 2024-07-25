/* 
Question: What are the most in-demand skills for business analysts?
- join job postings to inner join table similar to query 2
- identify the top 5 in demand skils for a data analyst
- focus on all job postings 
- why? retrieves the top 5 skills with the highest denand in the joh market,
    providiing insights into the most valuable skills for job seekers
*/

SELECT 
    skills,
    count(skills_job_dim.job_id) as demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Business Analyst' and
    job_location = 'Anywhere'
GROUP BY
    skills
ORDER BY
    demand_count DESC
limit 5
