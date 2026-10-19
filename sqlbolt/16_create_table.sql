-- SQLBolt Lesson 16: Creating tables
-- https://sqlbolt.com/lesson/creating_tables
-- Notes: CREATE TABLE defines columns, data types and (optionally) constraints.
--        IF NOT EXISTS avoids an error when the table already exists.

-- 1. Create a table named Database with columns Name (text), Version (float), Download_count (integer)
CREATE TABLE IF NOT EXISTS Database (
    Name TEXT,
    Version FLOAT,
    Download_count INTEGER
);

-- How I would design it in a real project:
-- - a primary key and NOT NULL on required columns
-- - version stored as TEXT (FLOAT turns "1.10" into 1.1 and can't hold "2.3.1")
-- - lowercase snake_case names, avoiding reserved words like DATABASE
--
-- CREATE TABLE IF NOT EXISTS databases (
--     id             INTEGER PRIMARY KEY,
--     name           TEXT NOT NULL,
--     version        TEXT,
--     download_count INTEGER NOT NULL DEFAULT 0
-- );
