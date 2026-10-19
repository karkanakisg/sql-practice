-- SQLBolt Lesson 13: Inserting rows
-- https://sqlbolt.com/lesson/inserting_rows
-- Tables: Movies (id, title, director, year, length_minutes)
--         Boxoffice (movie_id, rating, domestic_sales, international_sales)
-- Notes: Always list the target columns explicitly so the insert doesn't depend on column order.
--        id is a primary key in real databases: use the next free id (or let the DB auto-generate it),
--        otherwise the insert fails or duplicates break every JOIN on that id.

-- 1. Add the studio's new production, Toy Story 4, to the list of movies
INSERT INTO Movies (id, title, director, year, length_minutes)
VALUES (15, 'Toy Story 4', 'John Lasseter', 2026, 90);

-- 2. Add its box office record: rating 8.7, 340M domestic, 270M international
INSERT INTO Boxoffice (movie_id, rating, domestic_sales, international_sales)
VALUES (15, 8.7, 340000000, 270000000);
