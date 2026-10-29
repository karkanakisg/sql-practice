-- LeetCode 1075: Project Employees I
-- https://leetcode.com/problems/project-employees-i/
-- Difficulty: Easy · Dialect: MySQL
-- Tables: Project (project_id, employee_id), Employee (employee_id, name, experience_years)
-- Approach: Join each project's employees to their experience, then average per project.
--           Project.employee_id is a foreign key to Employee, so INNER and LEFT JOIN give the same
--           result here; LEFT JOIN is the defensive choice if an employee row were ever missing.

SELECT p.project_id,
       ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project AS p
LEFT JOIN Employee AS e
    ON p.employee_id = e.employee_id
GROUP BY p.project_id;
