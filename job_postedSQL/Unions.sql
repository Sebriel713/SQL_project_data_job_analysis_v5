SELECT 
job_title_short,
company_id,
job_location
FROM january_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs


--PROBLEM 1
SELECT 
    job_postings_fact.job_posted_date,
    skills,
    type
    
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.job_posted_date BETWEEN '2023-01-01' AND '2023-03-31'
LIMIT 100;

SELECT * FROM skills_dim
LIMIT 10;