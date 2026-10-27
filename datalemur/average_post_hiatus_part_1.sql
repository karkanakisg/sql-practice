-- DataLemur: Average Post Hiatus (Part 1) (Facebook)
-- https://datalemur.com/questions/sql-average-post-hiatus-1
-- Difficulty: Easy · Dialect: PostgreSQL
-- Table: posts (user_id, post_id, post_content, post_date)
-- Approach: Keep 2021 posts, group per user, keep users with 2+ posts,
--           and subtract first from last post date (date - date returns days in PostgreSQL).
-- Performance note: a date range (post_date >= '2021-01-01' AND post_date < '2022-01-01')
--                   is index-friendly ("sargable"); DATE_PART on the column is not.

SELECT user_id,
       MAX(post_date::DATE) - MIN(post_date::DATE) AS days_between
FROM posts
WHERE post_date >= '2021-01-01'
  AND post_date <  '2022-01-01'
GROUP BY user_id
HAVING COUNT(post_id) > 1;
