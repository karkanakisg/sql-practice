-- LeetCode 1934: Confirmation Rate
-- https://leetcode.com/problems/confirmation-rate/
-- Difficulty: Medium · Dialect: MySQL
-- Tables: Signups (user_id, time_stamp),
--         Confirmations (user_id, time_stamp, action ENUM('confirmed','timeout'))
-- Approach: Conditional aggregation.
--   - LEFT JOIN keeps users who never requested a confirmation (one row with NULL action).
--   - CASE turns each row into 1 (confirmed) or 0 (anything else, including NULL),
--     so AVG of those values is the confirmation rate; users with no requests get 0.00, not NULL.
--   - The shorter AVG(c.action = 'confirmed') would return NULL for them and need IFNULL(..., 0).

SELECT s.user_id,
       ROUND(AVG(CASE WHEN c.action = 'confirmed' THEN 1.0 ELSE 0.0 END), 2) AS confirmation_rate
FROM Signups AS s
LEFT JOIN Confirmations AS c
    ON s.user_id = c.user_id
GROUP BY s.user_id;
