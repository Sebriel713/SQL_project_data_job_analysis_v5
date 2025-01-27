WITH remote_job_skills AS (
    SELECT
        skill_id,
        COUNT(*) AS skill_count
    FROM
        skills_job_dim
    INNER JOIN job_postings_fact ON  job_postings_fact.job_id = skills_job_dim.job_id
    WHERE job_postings_fact.job_work_from_home  = TRUE
    AND
    job_postings_fact.job_title_short LIKE '%Data Analyst%'
    GROUP BY skill_id
)

SELECT 
    skills_dim.skill_id,
    skills_dim.skills AS skill_name,
    skill_count
FROM remote_job_skills
INNER JOIN skills_dim ON skills_dim.skill_id = remote_job_skills.skill_id
ORDER BY skill_count DESC
LIMIT 10
