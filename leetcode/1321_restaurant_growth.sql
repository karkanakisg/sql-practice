-- LeetCode 1321: Restaurant Growth
-- https://leetcode.com/problems/restaurant-growth/
-- Difficulty: Medium · Dialect: MySQL
-- Table: Customer (customer_id, name, visited_on, amount)
-- Approach: 7-day moving sum/average with a window frame.
--   1. daily: total amount per day (several customers can visit on the same day).
--   2. SUM(...) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
--      adds each day and the 6 before it; ROW_NUMBER marks how many days we've seen.
--   3. Keep rows from the 7th day on (rn >= 7), so every window is a full 7 days.
--   The problem guarantees a visit every day, so 7 rows = 7 consecutive days.
-- Alternative: self-join daily to itself ON DATEDIFF(c.visited_on, t.visited_on) BETWEEN 0 AND 6,
--   GROUP BY c.visited_on, HAVING COUNT(*) = 7.

WITH daily AS (
    SELECT visited_on, SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
),
moving AS (
    SELECT visited_on,
           SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
           ROW_NUMBER() OVER (ORDER BY visited_on) AS rn
    FROM daily
)

SELECT visited_on,
       amount,
       ROUND(amount / 7, 2) AS average_amount
FROM moving
WHERE rn >= 7
ORDER BY visited_on;
