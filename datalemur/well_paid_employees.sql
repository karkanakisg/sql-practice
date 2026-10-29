-- DataLemur: Well Paid Employees (FAANG)
-- https://datalemur.com/questions/sql-well-paid-employees
-- Difficulty: Easy · Dialect: PostgreSQL
-- Table: employee (employee_id, name, salary, department_id, manager_id)
-- Approach: Self-join each employee (e) to their manager (m) through manager_id,
--           then keep employees who earn more than their manager.
--           Join condition (who manages whom) in ON; the salary filter in WHERE.

SELECT e.employee_id, e.name AS employee_name
FROM employee AS e
INNER JOIN employee AS m
    ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;
