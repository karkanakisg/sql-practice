-- SQLBolt Lesson 4: Filtering and sorting query results
-- https://sqlbolt.com/lesson/filtering_sorting_query_results
-- Table: Movies (id, title, director, year, length_minutes)
-- Notes: DISTINCT removes duplicate rows; ORDER BY sorts (ASC default, DESC reverse);
--        LIMIT = how many rows to return, OFFSET = how many rows to skip first.

-- 1. List all directors of Pixar movies (alphabetically), without duplicates
SELECT DISTINCT director
FROM Movies
ORDER BY director ASC;

-- 2. List the last four Pixar movies released (ordered from most recent to least)
SELECT title, year
FROM Movies
ORDER BY year DESC
LIMIT 4;

-- 3. List the first five Pixar movies sorted alphabetically
SELECT title
FROM Movies
ORDER BY title ASC
LIMIT 5;

-- 4. List the next five Pixar movies sorted alphabetically
SELECT title
FROM Movies
ORDER BY title ASC
LIMIT 5 OFFSET 5;
