-- LeetCode 1661: Average Time of Process per Machine
-- https://leetcode.com/problems/average-time-of-process-per-machine/
-- Difficulty: Easy · Dialect: MySQL
-- Table: Activity (machine_id, process_id, activity_type ENUM('start','end'), timestamp)
-- Approach: Self-join to pair each process's start row with its end row, then average per machine.
--   - A process is identified by (machine_id, process_id): the same process_id exists on several machines,
--     so the join must match BOTH columns.
--   - WHERE keeps only start rows on the left and end rows on the right; without it the join also produces
--     start-start, end-start and cross-machine pairs, which corrupt the average.
-- Lesson learned: first attempt joined on process_id only — always ask what uniquely identifies a row.

SELECT s.machine_id,
       ROUND(AVG(e.timestamp - s.timestamp), 3) AS processing_time
FROM Activity AS s
INNER JOIN Activity AS e
    ON  s.machine_id = e.machine_id
    AND s.process_id = e.process_id
WHERE s.activity_type = 'start'
  AND e.activity_type = 'end'
GROUP BY s.machine_id;
