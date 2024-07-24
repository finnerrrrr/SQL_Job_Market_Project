/* 
Question: What are the most optimal skills to learn (high in demand and high_paying skill)
- identify skills in high demand and associated with high average salaries for Data Analyst roles
- concentrate on remote positions with specific salaries 
- why? Targets skills that offer joh security (high demand) and financial benefits (high salaries),
    offering strategies insights for career development in data analysis
*/

WITH skills_demand AS (
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    count(skills_job_dim.job_id) as demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' and
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id
),

avg_salaries as (
SELECT 
    skills_job_dim.skill_id,
    round(avg(salary_year_avg),0) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' and
    salary_year_avg IS NOT NULL
GROUP BY
    skills_job_dim.skill_id
)

select
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
from
    skills_demand
inner join avg_salaries on skills_demand.skill_id = avg_salaries.skill_id
where demand_count > 10
ORDER BY
    demand_count DESC,
    avg_salary DESC
LIMIT 25