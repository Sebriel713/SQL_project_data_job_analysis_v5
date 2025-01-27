SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact
WHERE job_title_short LIKE '%Analyst%'
GROUP BY location_category;

--PROBLEM 1
SELECT
    job_id,
    job_title,
    salary_year_avg,
    CASE
        WHEN salary_year_avg >= 100000 THEN 'High-earning'
        WHEN salary_year_avg BETWEEN 50000 AND 99999 THEN 'Middle-earning'
        WHEN salary_year_avg < 50000 THEN 'Low-earning'
        ELSE 'No salary data'
    END AS salary_category
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC;