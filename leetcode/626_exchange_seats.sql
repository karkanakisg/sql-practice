-- LeetCode 626: Exchange Seats
-- https://leetcode.com/problems/exchange-seats/
-- Difficulty: Medium · Dialect: MySQL
-- Table: Seat (id, student)
-- Approach: Swap each pair of consecutive seats using window functions inside CASE:
--   - even id → takes the previous student (LAG);
--   - odd id  → takes the next student (LEAD), or keeps its own if it is the last seat:
--     LEAD returns NULL there and IFNULL falls back to the current student.

SELECT id,
       CASE
           WHEN id % 2 = 0 THEN LAG(student) OVER (ORDER BY id)
           ELSE IFNULL(LEAD(student) OVER (ORDER BY id), student)
       END AS student
FROM Seat
ORDER BY id;
