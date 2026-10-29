-- LeetCode 1193: Monthly Transactions I
-- https://leetcode.com/problems/monthly-transactions-i/
-- Difficulty: Medium · Dialect: MySQL
-- Table: Transactions (id, country, state ENUM('approved','declined'), amount, trans_date)
-- Approach: Group by year-month and country, computing four metrics in one pass:
--   - DATE_FORMAT(..., '%Y-%m') keeps the year, so the same month of different years stays separate.
--   - SUM(CASE WHEN ... THEN 1 ...) counts approved transactions;
--     SUM(CASE WHEN ... THEN amount ...) sums amounts for approved ones only.
--   GROUP BY with a SELECT alias works in MySQL/PostgreSQL; repeating the expression is fully portable.

SELECT DATE_FORMAT(trans_date, '%Y-%m') AS month,
       country,
       COUNT(*) AS trans_count,
       SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
       SUM(amount) AS trans_total_amount,
       SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY month, country;
