-- SQLBolt Lesson 2: Queries with constraints (Pt. 1)
-- https://sqlbolt.com/lesson/select_queries_with_constraints
-- Table: Movies (id, title, director, year, length_minutes)
-- Notes: WHERE filters rows; BETWEEN is inclusive on both ends; NOT BETWEEN / NOT IN negate a condition; AND / OR combine conditions.

-- 1. Find the movie with a row id of 6
SELECT *
FROM Movies
WHERE id = 6 ;

-- 2. Find the movies released in the years between 2000 and 2010
SELECT *
FROM Movies
WHERE year BETWEEN 2000 AND 2010;

-- 3. Find the movies not released in the years between 2000 and 2010
SELECT *
FROM Movies
WHERE year NOT BETWEEN 2000 AND 2010;

-- 4. Find the first 5 Pixar movies and their release year
SELECT title, year
FROM Movies
WHERE id <= 5;
