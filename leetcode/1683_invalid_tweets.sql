-- LeetCode 1683: Invalid Tweets
-- https://leetcode.com/problems/invalid-tweets/
-- Difficulty: Easy · Dialect: MySQL
-- Table: Tweets (tweet_id, content)
-- Approach: A tweet is invalid if it has more than 15 characters.
--           CHAR_LENGTH counts characters; LENGTH counts bytes.
--           They match for ASCII, but differ for UTF-8 text:
--           'Γεια σου' = 8 characters but 15 bytes (Greek letters are 2 bytes each).

SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15;
