-- LeetCode 1633: Percentage of Users Attended a Contest
-- https://leetcode.com/problems/percentage-of-users-attended-a-contest/
-- Difficulty: Easy · Dialect: MySQL
-- Tables: Users (user_id, user_name), Register (contest_id, user_id)
-- Approach: Registered users per contest divided by total users.
--   - Scalar subquery (SELECT COUNT(*) FROM Users) supplies the total for every row.
--   - Multiply by 100.0 so the division is decimal in every database (integer division truncates).
--   - COUNT(DISTINCT user_id) guards against duplicate registrations.

SELECT contest_id,
       ROUND(COUNT(DISTINCT user_id) * 100.0 / (SELECT COUNT(*) FROM Users), 2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC;
