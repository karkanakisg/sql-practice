-- LeetCode 1378: Replace Employee ID With The Unique Identifier
-- https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/
-- Difficulty: Easy · Dialect: MySQL
-- Tables: Employees (id, name), EmployeeUNI (id, unique_id)
-- Approach: Every employee must appear, even without a unique_id (shown as NULL),
--           so keep Employees as the preserved side of an outer join.
--           My first solution used EmployeeUNI RIGHT JOIN Employees; the LEFT JOIN below is
--           equivalent and more conventional (main table on the left).

SELECT uni.unique_id, e.name
FROM Employees AS e
LEFT JOIN EmployeeUNI AS uni
    ON e.id = uni.id;
