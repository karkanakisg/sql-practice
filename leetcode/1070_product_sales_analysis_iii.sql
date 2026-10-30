-- LeetCode 1070: Product Sales Analysis III
-- https://leetcode.com/problems/product-sales-analysis-iii/
-- Difficulty: Medium · Dialect: MySQL
-- Table: Sales (sale_id, product_id, year, quantity, price)
-- Approach: Same pattern as 1174 —
--   1. Subquery finds each product's first year: MIN(year) per product_id.
--   2. Tuple IN keeps ALL sales rows from that (product, year), since a product can have
--      several sales in its first year.
-- Lesson learned: first attempt used GROUP BY product_id with quantity and price unaggregated;
--   those "bare" columns come from an arbitrary row (or error under ONLY_FULL_GROUP_BY),
--   and GROUP BY also collapses multiple first-year sales into one row.

SELECT product_id,
       year AS first_year,
       quantity,
       price
FROM Sales
WHERE (product_id, year) IN (
    SELECT product_id, MIN(year)
    FROM Sales
    GROUP BY product_id
);
