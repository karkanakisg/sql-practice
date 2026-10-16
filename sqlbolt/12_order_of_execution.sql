-- SQLBolt Lesson 12: Order of execution of a query
-- https://sqlbolt.com/lesson/select_queries_order_of_execution
-- Tables: Movies (id, title, director, year, length_minutes)
--         Boxoffice (movie_id, rating, domestic_sales, international_sales)
-- Notes: Logical order: FROM/JOIN → WHERE → GROUP BY → HAVING → SELECT → DISTINCT → ORDER BY → LIMIT/OFFSET.
--        That's why SELECT aliases work in ORDER BY but not in WHERE.

-- 1. Find the number of movies each director has directed
SELECT director, COUNT(*) AS total_movies
FROM Movies
GROUP BY director;

-- 2. Find the total domestic and international sales that can be attributed to each director
-- LEFT JOIN keeps directors even if a movie has no box office row (their total becomes NULL);
-- INNER JOIN would silently drop them.
SELECT m.director, SUM(b.domestic_sales + b.international_sales) AS total_sales
FROM Movies AS m
LEFT JOIN Boxoffice AS b
    ON m.id = b.movie_id
GROUP BY m.director;
