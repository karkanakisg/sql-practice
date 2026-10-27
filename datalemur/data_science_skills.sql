-- DataLemur: Data Science Skills (LinkedIn)
-- https://datalemur.com/questions/matching-skills
-- Difficulty: Easy · Dialect: PostgreSQL
-- Table: candidates (candidate_id, skill)
-- Approach: "Has ALL of X" pattern — filter to the required skills, group per candidate,
--           keep candidates whose number of distinct matching skills equals the number required.
--           COUNT(DISTINCT skill) guards against duplicate (candidate, skill) rows.

SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(DISTINCT skill) = 3
ORDER BY candidate_id;
