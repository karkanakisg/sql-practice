-- LeetCode 180: Consecutive Numbers
-- https://leetcode.com/problems/consecutive-numbers/
-- Difficulty: Medium · Dialect: MySQL
-- Table: Logs (id, num)
-- Approach: Window functions — LAG/LEAD put each row's previous and next num on the same row,
--           so "3 in a row" becomes num = prev_num AND num = next_num.
--   - First/last rows get NULL neighbours; num = NULL is never TRUE, so they drop out naturally.
--   - DISTINCT: a run of 4+ matches on several rows and would return the number more than once.
--   - Ordered by id → consecutive ROWS; if ids could skip values and consecutive ids mattered,
--     also check id - LAG(id) = 1.

WITH logs_with_neighbors AS (
    SELECT num,
           LAG(num)  OVER (ORDER BY id) AS prev_num,
           LEAD(num) OVER (ORDER BY id) AS next_num
    FROM Logs
)

SELECT DISTINCT num AS ConsecutiveNums
FROM logs_with_neighbors
WHERE num = prev_num
  AND num = next_num;
