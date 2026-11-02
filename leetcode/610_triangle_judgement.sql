-- LeetCode 610: Triangle Judgement
-- https://leetcode.com/problems/triangle-judgement/
-- Difficulty: Easy · Dialect: MySQL
-- Table: Triangle (x, y, z), PK (x, y, z)
-- Approach: Triangle inequality — each pair of sides must sum to MORE than the third.
--           Strict > excludes degenerate cases like (1, 2, 3), where the sides lie on one line.

SELECT x, y, z,
       CASE
           WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'
           ELSE 'No'
       END AS triangle
FROM Triangle;
