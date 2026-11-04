-- LeetCode 1341: Movie Rating
-- https://leetcode.com/problems/movie-rating/
-- Difficulty: Medium · Dialect: MySQL
-- Tables: Movies (movie_id, title), Users (user_id, name),
--         MovieRating (movie_id, user_id, rating, created_at)
-- Approach: Two independent top-1 queries stacked with UNION ALL.
--   1. User with the most ratings; ties broken alphabetically by name.
--   2. Movie with the highest average rating in February 2020; ties broken alphabetically by title.
--   - Each part needs its own ORDER BY ... LIMIT, so each is wrapped in parentheses.
--   - UNION ALL, not UNION: if the user's name equals the movie's title, UNION would merge them.
--   - "February 2020" is a date range; MONTH(created_at) = 2 alone would include other years.

(
    SELECT u.name AS results
    FROM MovieRating AS mr
    INNER JOIN Users AS u
        ON mr.user_id = u.user_id
    GROUP BY u.user_id, u.name
    ORDER BY COUNT(*) DESC, u.name ASC
    LIMIT 1
)
UNION ALL
(
    SELECT m.title AS results
    FROM MovieRating AS mr
    INNER JOIN Movies AS m
        ON mr.movie_id = m.movie_id
    WHERE mr.created_at >= '2020-02-01'
      AND mr.created_at <  '2020-03-01'
    GROUP BY m.movie_id, m.title
    ORDER BY AVG(mr.rating) DESC, m.title ASC
    LIMIT 1
);
