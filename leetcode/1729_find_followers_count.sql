-- LeetCode 1729: Find Followers Count
-- https://leetcode.com/problems/find-followers-count/
-- Difficulty: Easy · Dialect: MySQL
-- Table: Followers (user_id, follower_id), PK (user_id, follower_id)
-- Approach: Count followers per user; the primary key rules out duplicate follower rows.
--           ORDER BY is required by the problem — without it, row order is not guaranteed.

SELECT user_id, COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;
