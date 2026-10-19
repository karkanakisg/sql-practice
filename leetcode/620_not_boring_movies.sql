-- LeetCode 620: Not Boring Movies
-- https://leetcode.com/problems/not-boring-movies/
-- Difficulty: Easy · Dialect: MySQL
-- Table: Cinema (id, movie, description, rating)
-- Approach: Filter odd ids (id % 2 = 1) and non-boring descriptions, then sort by rating descending.

SELECT id, movie, description, rating
FROM Cinema
WHERE id % 2 = 1
  AND description != 'boring'
ORDER BY rating DESC;
