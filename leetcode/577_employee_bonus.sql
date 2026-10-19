-- LeetCode 577: Employee Bonus
-- https://leetcode.com/problems/employee-bonus/
-- Difficulty: Easy · Dialect: MySQL
-- Tables: Employee (empId, name, supervisor, salary), Bonus (empId, bonus)
-- Approach: LEFT JOIN keeps employees with no bonus row (bonus becomes NULL).
--           NULL < 1000 is UNKNOWN, not TRUE, so those employees must be included with IS NULL.
--           No GROUP BY needed: empId is the primary key of Bonus, so the join can't duplicate employees.

SELECT e.name, b.bonus
FROM Employee AS e
LEFT JOIN Bonus AS b
    ON e.empId = b.empId
WHERE b.bonus < 1000
   OR b.bonus IS NULL;
