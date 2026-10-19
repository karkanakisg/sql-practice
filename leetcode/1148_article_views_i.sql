-- LeetCode 1148: Article Views I
-- https://leetcode.com/problems/article-views-i/
-- Difficulty: Easy · Dialect: MySQL
-- Table: Views (article_id, author_id, viewer_id, view_date)
-- Approach: An author viewed their own article when author_id = viewer_id.
--           DISTINCT because the same author can view several of their articles (or one article many times).
--           Output column must be named id, sorted ascending.

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC;
