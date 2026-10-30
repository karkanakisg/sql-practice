-- LeetCode 1731: The Number of Employees Which Report to Each Employee
-- https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/
-- Difficulty: Easy · Dialect: MySQL
-- Table: Employees (employee_id, name, reports_to, age)
-- Approach: Self-join each manager (m) to their direct reports (e), then count reports and
--           average their age (rounded to the nearest integer) per manager.
--           INNER JOIN already keeps only employees with at least one report, so no HAVING needed.

SELECT m.employee_id,
       m.name,
       COUNT(e.employee_id) AS reports_count,
       ROUND(AVG(e.age)) AS average_age
FROM Employees AS m
INNER JOIN Employees AS e
    ON e.reports_to = m.employee_id
GROUP BY m.employee_id, m.name
ORDER BY m.employee_id;
