-- SQLBolt Lesson 15: Deleting rows
-- https://sqlbolt.com/lesson/deleting_rows
-- Table: Movies (id, title, director, year, length_minutes)
-- Notes: Never run DELETE without WHERE — it removes every row.
--        Run a SELECT with the same WHERE first to see what will be deleted.

-- 1. Remove all movies that were released before 2005
DELETE FROM Movies
WHERE year < 2005;

-- 2. Andrew Stanton has left the studio, so remove all movies directed by him
DELETE FROM Movies
WHERE director = 'Andrew Stanton';
