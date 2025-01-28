# Introduction
I dive into the data job market. Specifically this will look into 
**Remote data analyst/scientis** roles.


## WARNING
This is the result of a course I did and it DOES NOT constitutes a full personal project. It is full of holes and was simply a LEARNING EXPERIENCE. This README is not even completed.

FOR THE SQL QUERIES: [project_sql folder](/project_sql/)
# Background
In order to look at that we analyse the following questions:
- What are top paying jobs for my role?
- What are the skills requiered for these top paying roles?
- What are the most in-demand skills for my role?
- What are the tops skills based on salary for my role?
- What are the most optimal skills to learn?
# Tools I used
 - **SQL** :The main tools for my analysis.
 - **PostgreSQL**
 - **VS code**
 - **Git and Github**
# Analysis
### 1. Top Paying Data Analyst Jobs
    This was to identify the top highest paying roles. I filtered this by the average yearly salary. I **only**  focused on remote jobs. 

    CODE:
    ```sql
    SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM 
    job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10
    ```
# What I learned
    -SQL
    -Uses of queries
    -Joints
    -Being creative

# Conclusions
This project helped me start my journey on SQL, and it definitely helped me understand and use the language. I still have a lot to learn and I should open up to doing a new project.