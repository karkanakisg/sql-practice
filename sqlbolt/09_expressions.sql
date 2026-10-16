-- SQLBolt Lesson 9: Queries with expressions
-- https://sqlbolt.com/lesson/select_queries_with_expressions
-- Tables: Movies (id, title, director, year, length_minutes)
--         Boxoffice (movie_id, rating, domestic_sales, international_sales)
-- Notes: Expressions can compute new columns; AS gives them a name.
--        Integer / integer truncates decimals; divide by 1000000.0 to keep them.

-- 1. List all movies and their combined sales in millions of dollars
SELECT m.title,
       (b.domestic_sales + b.international_sales) / 1000000.0 AS total_sales_millions
FROM Movies AS m
INNER JOIN Boxoffice AS b
    ON m.id = b.movie_id;

-- 2. List all movies and their ratings in percent
SELECT m.title, b.rating * 10 AS rating_percent
FROM Movies AS m
INNER JOIN Boxoffice AS b
    ON m.id = b.movie_id;

-- 3. List all movies that were released on even number years
SELECT title, year
FROM Movies
WHERE year % 2 = 0;
