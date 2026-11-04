-- LeetCode 1907: Count Salary Categories
-- https://leetcode.com/problems/count-salary-categories/
-- Difficulty: Medium · Dialect: MySQL
-- Table: Accounts (account_id, income)
-- Approach: Every category must appear even with 0 accounts, which GROUP BY can't produce,
--           so build the three rows explicitly and stack them with UNION ALL.
--   - UNION ALL (not UNION): rows are distinct by construction, so skip the duplicate removal.
--   - COUNT(CASE ... THEN 1 END) returns 0 even on an empty table; SUM would return NULL.
--   - Column names come from the first SELECT of the UNION.

SELECT 'Low Salary' AS category,
       COUNT(CASE WHEN income < 20000 THEN 1 END) AS accounts_count
FROM Accounts
UNION ALL
SELECT 'Average Salary',
       COUNT(CASE WHEN income BETWEEN 20000 AND 50000 THEN 1 END)
FROM Accounts
UNION ALL
SELECT 'High Salary',
       COUNT(CASE WHEN income > 50000 THEN 1 END)
FROM Accounts;
