-- SQLBolt Lesson 1: SELECT queries 101
-- https://sqlbolt.com/lesson/select_queries_introduction
-- Table: Movies (id, title, director, year, length_minutes)
-- Notes: SELECT picks columns, FROM picks the table; * returns all columns (fine for exploring, avoid in production queries).

-- 1. Find the title of each film
SELECT title
FROM Movies;

-- 2. Find the director of each film
SELECT director
FROM Movies;

-- 3. Find the title and director of each film
SELECT title, director
FROM Movies;

-- 4. Find the title and year of each film
SELECT title, year
FROM Movies;

-- 5. Find all the information about each film
SELECT *
FROM Movies;
