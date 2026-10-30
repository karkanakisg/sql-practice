-- LeetCode 550: Game Play Analysis IV
-- https://leetcode.com/problems/game-play-analysis-iv/
-- Difficulty: Medium · Dialect: MySQL
-- Table: Activity (player_id, device_id, event_date, games_played), PK (player_id, event_date)
-- Approach:
--   1. CTE finds each player's first login date.
--   2. LEFT JOIN looks for a login exactly one day after it; only returning players get a match.
--   3. COUNT(a.player_id) skips NULLs (returning players) / COUNT(*) (all players) = fraction.
-- Lesson learned: first attempt counted ANY two consecutive login days, not the day after the
--   FIRST login — always test the solution against a small counterexample.

WITH first_login AS (
    SELECT player_id, MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
)

SELECT ROUND(COUNT(a.player_id) * 1.0 / COUNT(*), 2) AS fraction
FROM first_login AS f
LEFT JOIN Activity AS a
    ON  a.player_id = f.player_id
    AND a.event_date = DATE_ADD(f.first_date, INTERVAL 1 DAY);
