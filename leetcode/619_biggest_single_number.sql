-- LeetCode 619: Biggest Single Number
-- https://leetcode.com/problems/biggest-single-number/
-- Difficulty: Easy · Dialect: MySQL
-- Table: MyNumbers (num)
-- Approach:
--   1. CTE keeps numbers that appear exactly once (GROUP BY + HAVING COUNT = 1).
--   2. MAX over the CTE returns the largest one.
--   If no single number exists, MAX over an empty set returns one row with NULL, as required;
--   ORDER BY num DESC LIMIT 1 would return no rows instead.

WITH single_numbers AS (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
)

SELECT MAX(num) AS num
FROM single_numbers;
