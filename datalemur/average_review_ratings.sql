-- DataLemur: Average Review Ratings (Amazon)
-- https://datalemur.com/questions/sql-avg-review-ratings
-- Difficulty: Easy · Dialect: PostgreSQL
-- Table: reviews (review_id, user_id, submit_date, product_id, stars)
-- Approach: Group by month and product, average the stars, round to 2 decimals.
-- Caveat: EXTRACT(MONTH ...) drops the year, so June 2022 and June 2023 would merge.
--         Fine here (one year of data); on real data use DATE_TRUNC('month', submit_date).

SELECT EXTRACT(MONTH FROM submit_date) AS mth,
       product_id AS product,
       ROUND(AVG(stars), 2) AS avg_stars
FROM reviews
GROUP BY EXTRACT(MONTH FROM submit_date), product_id
ORDER BY mth, product;
