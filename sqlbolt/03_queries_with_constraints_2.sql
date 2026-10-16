-- SQLBolt Lesson 3: Queries with constraints (Pt. 2)
-- https://sqlbolt.com/lesson/select_queries_with_constraints_pt_2
-- Table: Movies (id, title, director, year, length_minutes)
-- Notes: Use = / != for exact text matches and LIKE for patterns.
--        % matches any number of characters, _ matches exactly one.

-- 1. Find all the Toy Story movies
SELECT *
FROM Movies
WHERE title LIKE '%Toy Story%';

-- 2. Find all the movies directed by John Lasseter
SELECT *
FROM Movies
WHERE director = 'John Lasseter';

-- 3. Find all the movies (and director) not directed by John Lasseter
SELECT title, director
FROM Movies
WHERE director != 'John Lasseter';

-- 4. Find all the WALL-* movies
SELECT *
FROM Movies
WHERE title LIKE 'WALL-%';
