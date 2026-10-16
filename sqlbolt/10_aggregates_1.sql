-- SQLBolt Lesson 10: Queries with aggregates (Pt. 1)
-- https://sqlbolt.com/lesson/select_queries_with_aggregates
-- Table: Employees (role, name, building, years_employed)
-- Notes: Aggregates (COUNT, SUM, AVG, MIN, MAX) collapse rows into one value per group.
--        GROUP BY defines the groups. Every SELECT column must be aggregated or in GROUP BY.

-- 1. Find the longest time that an employee has been at the studio
SELECT MAX(years_employed) AS max_years
FROM Employees;

-- 2. For each role, find the average number of years employed by employees in that role
SELECT role, AVG(years_employed) AS avg_years
FROM Employees
GROUP BY role;

-- 3. Find the total number of employee years worked in each building
SELECT building, SUM(years_employed) AS total_years
FROM Employees
GROUP BY building;
