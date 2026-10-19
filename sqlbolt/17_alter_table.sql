-- SQLBolt Lesson 17: Altering tables
-- https://sqlbolt.com/lesson/altering_tables
-- Table: Movies (id, title, director, year, length_minutes)
-- Notes: ALTER TABLE ... ADD COLUMN adds a column to an existing table.
--        DEFAULT values follow normal literal rules: text goes in single quotes ('English').
--        Data is case-sensitive: 'ENGLISH' and 'English' are different values.

-- 1. Add a column named Aspect_ratio with a FLOAT data type
ALTER TABLE Movies
ADD COLUMN Aspect_ratio FLOAT;

-- 2. Add a column named Language with a TEXT data type, defaulting to English
ALTER TABLE Movies
ADD COLUMN Language TEXT DEFAULT 'English';
