-- SQLBolt Lesson 7: OUTER JOINs
-- https://sqlbolt.com/lesson/select_queries_with_outer_joins
-- Tables: Buildings (building_name, capacity)
--         Employees (role, name, building, years_employed)
-- Notes: LEFT JOIN keeps every row from the left table, even without a match;
--        unmatched columns from the right table come back as NULL.
--        INNER JOIN would drop buildings that have no employees.

-- 1. Find the list of all buildings that have employees
SELECT DISTINCT building
FROM Employees;

-- 2. Find the list of all buildings and their capacity
SELECT building_name, capacity
FROM Buildings;

-- 3. List all buildings and the distinct employee roles in each building (including empty buildings)
SELECT DISTINCT b.building_name, e.role
FROM Buildings AS b
LEFT JOIN Employees AS e
    ON b.building_name = e.building;
