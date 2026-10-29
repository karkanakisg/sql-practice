-- LeetCode 1211: Queries Quality and Percentage
-- https://leetcode.com/problems/queries-quality-and-percentage/
-- Difficulty: Easy · Dialect: MySQL
-- Table: Queries (query_name, result, position, rating)
-- Approach: Two metrics per query_name in one pass:
--   - quality: average of rating / position
--   - poor_query_percentage: conditional aggregation, share of ratings below 3, times 100
--   rating * 1.0 / position keeps decimals in every database
--   (MySQL's / is already decimal, but PostgreSQL truncates integer division).

SELECT query_name,
       ROUND(AVG(rating * 1.0 / position), 2) AS quality,
       ROUND(AVG(CASE WHEN rating < 3 THEN 1.0 ELSE 0.0 END) * 100, 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;
