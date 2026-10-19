-- SQLBolt Lesson 14: Updating rows
-- https://sqlbolt.com/lesson/altering_rows
-- Table: Movies (id, title, director, year, length_minutes)
-- Notes: Never run UPDATE without WHERE — it changes every row.
--        Run a SELECT with the same WHERE first to check which rows will change.
--        Escape an apostrophe inside a string by doubling it: 'A Bug''s Life'.
--        Filtering by primary key (id) is safer than by title, which may not be unique.

-- 1. The director for A Bug's Life is incorrect, it was actually directed by John Lasseter
UPDATE Movies
SET director = 'John Lasseter'
WHERE title = 'A Bug''s Life';

-- 2. The year that Toy Story 2 was released is incorrect, it was actually released in 1999
UPDATE Movies
SET year = 1999
WHERE title = 'Toy Story 2';

-- 3. Both the title and director for Toy Story 8 are incorrect:
--    the title should be "Toy Story 3" and it was directed by Lee Unkrich
UPDATE Movies
SET title = 'Toy Story 3',
    director = 'Lee Unkrich'
WHERE title = 'Toy Story 8';
