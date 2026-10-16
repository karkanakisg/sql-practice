-- SQLBolt Lesson 8: A short note on NULLs
-- https://sqlbolt.com/lesson/select_queries_with_nulls
-- Tables: Buildings (building_name, capacity)
--         Employees (role, name, building, years_employed)
-- Notes: Test for missing values with IS NULL / IS NOT NULL; "= NULL" is never true.
--        Anti-join pattern: LEFT JOIN + WHERE right_table.join_key IS NULL
--        returns rows from the left table that have no match on the right.

-- 1. Find the name and role of all employees who have not been assigned to a building
SELECT e.name, e.role
FROM Employees AS e
WHERE e.building IS NULL;

-- 2. Find the names of the buildings that hold no employees
SELECT b.building_name
FROM Buildings AS b
LEFT JOIN Employees AS e
    ON b.building_name = e.building
WHERE e.building IS NULL;
