-- LeetCode 584: Find Customer Referee
-- https://leetcode.com/problems/find-customer-referee/
-- Difficulty: Easy · Dialect: MySQL
-- Table: Customer (id, name, referee_id)
-- Approach: Keep customers not referred by id 2. NULL != 2 evaluates to UNKNOWN (not TRUE),
--           so customers with no referee must be included explicitly with IS NULL.
-- Alternative: WHERE COALESCE(referee_id, 0) != 2

SELECT name
FROM Customer
WHERE referee_id != 2
   OR referee_id IS NULL;
