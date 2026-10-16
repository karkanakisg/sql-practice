-- SQLBolt Lesson 11: Queries with aggregates (Pt. 2)
-- https://sqlbolt.com/lesson/select_queries_with_aggregates_pt_2
-- Table: Employees (role, name, building, years_employed)
-- Notes: WHERE filters rows BEFORE grouping; HAVING filters groups AFTER aggregation.
--        Use WHERE for plain columns (role = 'Engineer'), HAVING for aggregates (COUNT(*) > 2).

-- 1. Find the number of Artists in the studio (without a HAVING clause)
SELECT COUNT(*) AS total_artists
FROM Employees
WHERE role = 'Artist';

-- 2. Find the number of Employees of each role in the studio
SELECT role, COUNT(*) AS total_employees
FROM Employees
GROUP BY role;

-- 3. Find the total number of years employed by all Engineers
-- WHERE is preferred here: role is a plain column, so filter rows before grouping.
-- HAVING role = 'Engineer' also works, but HAVING is meant for conditions on aggregates.
SELECT role, SUM(years_employed) AS total_years_employed
FROM Employees
WHERE role = 'Engineer'
GROUP BY role;
