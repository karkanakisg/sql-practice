-- LeetCode 1141: User Activity for the Past 30 Days I
-- https://leetcode.com/problems/user-activity-for-the-past-30-days-i/
-- Difficulty: Easy · Dialect: MySQL
-- Table: Activity (user_id, session_id, activity_date,
--                  activity_type ENUM('open_session','end_session','scroll_down','send_message'))
-- Approach: Keep the 30-day window ending 2019-07-27 inclusive, count distinct users per day.
--   - 30 days inclusive = end date minus 29 days (2019-06-28 to 2019-07-27).
--   - No activity_type filter needed: any activity makes a user active,
--     and listing every ENUM value filters nothing.

SELECT activity_date AS day,
       COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
GROUP BY activity_date;
