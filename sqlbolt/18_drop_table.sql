-- SQLBolt Lesson 18: Dropping tables
-- https://sqlbolt.com/lesson/dropping_tables
-- Notes: DROP TABLE removes the table and all its data permanently.
--        IF EXISTS avoids an error if the table is already gone.
--        With foreign keys, drop the referencing (child) table first: Boxoffice before Movies.

-- 1. Remove the Movies table
DROP TABLE IF EXISTS Movies;

-- 2. Remove the BoxOffice table as well
DROP TABLE IF EXISTS BoxOffice;
