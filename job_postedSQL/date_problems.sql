--PROBLEM 1

SELECT 
    job_schedule_type,
    AVG(salary_hour_avg) AS average_per_hour,
    AVG(salary_year_avg) AS average_per_year
FROM job_postings_fact
WHERE
    job_posted_date::DATE > '2023-06-01'
GROUP BY job_schedule_type
ORDER BY average_per_year DESC;

--PROBLEM 2
SELECT 
    COUNT(job_id) AS number_jobs,
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') as month
FROM job_postings_fact
GROUP BY month 
ORDER BY month ASC;

--PROBLEM 3
SELECT 
    company_dim.name
FROM company_dim
    LEFT JOIN job_postings_fact ON company_dim.company_id = job_postings_fact.company_id
WHERE
    job_postings_fact.job_health_insurance = True
    AND
    job_posted_date::DATE BETWEEN '2023-04-01' AND '2023-06-30'
GROUP BY company_dim.name
LIMIT 400;