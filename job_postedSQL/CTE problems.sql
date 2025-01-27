--PROBLEM 1

SELECT *
FROM (
    SELECT
        skills_dim.skills AS Skill,
        COUNT(skills_dim.skills) AS number_skills
    FROM job_postings_fact
    LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    GROUP BY skills_dim.skills
    ORDER BY number_skills DESC

)
AS january_jobs;

--PROBLEM 2
SELECT * 
FROM ( 
    SELECT 
        company_dim.name AS company,
        COUNT(job_postings_fact.job_id) AS number_jobs_postings
    FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    GROUP BY company
    ORDER BY number_jobs_postings DESC

) AS number_jobs;

WITH number_jobs AS (
    SELECT 
        company_dim.name AS company,
        COUNT(job_postings_fact.job_id) AS number_jobs_postings
    FROM 
        job_postings_fact
    LEFT JOIN 
        company_dim ON job_postings_fact.company_id = company_dim.company_id
    GROUP BY 
        company_dim.name
)
SELECT 
    company,
    number_jobs_postings,
    CASE
        WHEN number_jobs_postings < 10 THEN 'Small'
        WHEN number_jobs_postings BETWEEN 10 AND 50 THEN 'Medium'
        WHEN number_jobs_postings > 50 THEN 'Large'
    END AS company_size
FROM 
    number_jobs
ORDER BY 
    number_jobs_postings DESC;