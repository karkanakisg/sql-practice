-- LeetCode 197: Rising Temperature
-- https://leetcode.com/problems/rising-temperature/
-- Difficulty: Easy · Dialect: MySQL
-- Table: Weather (id, recordDate, temperature)
-- Approach: Self-join Weather to itself, pairing each day with the day before.
--   - DATEDIFF(today, yesterday) = 1 pairs consecutive dates; don't rely on id + 1,
--     because ids aren't guaranteed to follow date order and days may be missing.
--   - Join condition (how rows relate) goes in ON; the filter (warmer) goes in WHERE.
--     With INNER JOIN both placements give the same result, but with LEFT JOIN they don't.

SELECT today.id
FROM Weather AS today
INNER JOIN Weather AS yesterday
    ON DATEDIFF(today.recordDate, yesterday.recordDate) = 1
WHERE today.temperature > yesterday.temperature;
