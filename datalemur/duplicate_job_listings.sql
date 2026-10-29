-- DataLemur: Duplicate Job Listings (LinkedIn)
-- https://datalemur.com/questions/duplicate-job-listings
-- Difficulty: Easy · Dialect: PostgreSQL
-- Table: job_listings (job_id, company_id, title, description, post_date)
-- Approach: CTE in two steps —
--   1. Count how many times each (company, title, description) combination appears.
--   2. Count companies with at least one combination appearing more than once.
--   COUNT(DISTINCT company_id): a company with two different duplicated listings must count once.

WITH job_count_cte AS (
    SELECT company_id,
           title,
           description,
           COUNT(job_id) AS job_count
    FROM job_listings
    GROUP BY company_id, title, description
)

SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM job_count_cte
WHERE job_count > 1;
