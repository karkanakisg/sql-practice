-- DataLemur: Unfinished Parts (Tesla)
-- https://datalemur.com/questions/tesla-unfinished-parts
-- Difficulty: Easy · Dialect: PostgreSQL
-- Table: parts_assembly (part, finish_date, assembly_step)
-- Approach: A step is unfinished when finish_date is missing; test with IS NULL
--           (= NULL is never TRUE).

SELECT part, assembly_step
FROM parts_assembly
WHERE finish_date IS NULL;
