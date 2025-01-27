SELECT job_posted_date
FROM job_postings_fact
LIMIT 20;

SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date    
FROM job_postings_fact
LIMIT 200;

SELECT 
    job_title_short AS title,
    job_location AS location,
    --This gets date of timezone UTC to EST
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time    
FROM job_postings_fact
LIMIT 200;

SELECT 
    job_title_short AS title,
    job_location AS location,
    --This gets date of timezone UTC to EST
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(DAY FROM job_posted_date) AS date_day

FROM job_postings_fact
LIMIT 200;

SELECT 
    COUNT(job_id),
    EXTRACT(MONTH FROM job_posted_date) AS date_month

FROM job_postings_fact
GROUP BY
    date_month
LIMIT 200;

SELECT 
    COUNT(job_id) AS number_jobs,
    EXTRACT(MONTH FROM job_posted_date) AS date_month

FROM job_postings_fact
WHERE
    job_title_short LIKE '%Data Analyst%'
GROUP BY
    date_month
ORDER BY
    number_jobs DESC
LIMIT 200;

