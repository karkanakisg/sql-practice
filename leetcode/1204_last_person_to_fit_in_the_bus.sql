-- LeetCode 1204: Last Person to Fit in the Bus
-- https://leetcode.com/problems/last-person-to-fit-in-the-bus/
-- Difficulty: Medium · Dialect: MySQL
-- Table: Queue (person_id, person_name, weight, turn)
-- Approach: Running total — SUM(weight) OVER (ORDER BY turn) gives the total weight on the bus
--           after each person boards. Keep people while it is <= 1000, then take the last by turn.
-- Note: MySQL table names are case-sensitive on Linux, so write Queue, not QUEUE.

WITH boarding AS (
    SELECT person_name,
           turn,
           SUM(weight) OVER (ORDER BY turn) AS running_weight
    FROM Queue
)

SELECT person_name
FROM boarding
WHERE running_weight <= 1000
ORDER BY turn DESC
LIMIT 1;
