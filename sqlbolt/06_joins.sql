-- SQLBolt Lesson 6: Multi-table queries with JOINs
-- https://sqlbolt.com/lesson/select_queries_with_joins
-- Tables: Movies (id, title, director, year, length_minutes)
--         Boxoffice (movie_id, rating, domestic_sales, international_sales)
-- Notes: INNER JOIN keeps only rows that match in both tables (here Movies.id = Boxoffice.movie_id).
--        Table aliases (m, b) make it clear which table each column comes from.

-- 1. Find the domestic and international sales for each movie
SELECT m.title, b.domestic_sales, b.international_sales
FROM Movies AS m
INNER JOIN Boxoffice AS b
    ON m.id = b.movie_id;

-- 2. Show the sales numbers for each movie that did better internationally rather than domestically
SELECT m.title, b.domestic_sales, b.international_sales
FROM Movies AS m
INNER JOIN Boxoffice AS b
    ON m.id = b.movie_id
WHERE b.international_sales > b.domestic_sales;

-- 3. List all the movies by their ratings in descending order
SELECT m.title, b.rating
FROM Movies AS m
INNER JOIN Boxoffice AS b
    ON m.id = b.movie_id
ORDER BY b.rating DESC;
