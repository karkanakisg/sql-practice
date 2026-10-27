-- DataLemur: Page With No Likes (Facebook)
-- https://datalemur.com/questions/sql-page-with-no-likes
-- Difficulty: Easy · Dialect: PostgreSQL
-- Tables: pages (page_id, page_name), page_likes (user_id, page_id, liked_date)
-- Approach: Anti-join — LEFT JOIN keeps every page; pages with no likes get NULL from page_likes,
--           so filter on the join key being NULL.
-- Alternative: WHERE NOT EXISTS (SELECT 1 FROM page_likes pl WHERE pl.page_id = p.page_id)
-- Avoid NOT IN here: if the subquery returns any NULL, NOT IN returns no rows at all.

SELECT p.page_id
FROM pages AS p
LEFT JOIN page_likes AS pl
    ON p.page_id = pl.page_id
WHERE pl.page_id IS NULL
ORDER BY p.page_id;
