-- LeetCode 1164: Product Price at a Given Date
-- https://leetcode.com/problems/product-price-at-a-given-date/
-- Difficulty: Medium · Dialect: MySQL
-- Table: Products (product_id, new_price, change_date), PK (product_id, change_date)
-- Approach: "Latest record per group as of a date" —
--   1. all_products: every product, including ones with no change by the date.
--   2. latest_change: changes up to 2019-08-16, numbered per product from most recent (ROW_NUMBER);
--      rn = 1 is the price in effect on that date.
--   3. LEFT JOIN + COALESCE(..., 10): products without an earlier change keep the default price 10.
--   rn = 1 sits in ON, not WHERE: in WHERE it would drop unmatched products (rn is NULL).

WITH all_products AS (
    SELECT DISTINCT product_id
    FROM Products
),
latest_change AS (
    SELECT product_id,
           new_price,
           ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rn
    FROM Products
    WHERE change_date <= '2019-08-16'
)

SELECT p.product_id,
       COALESCE(l.new_price, 10) AS price
FROM all_products AS p
LEFT JOIN latest_change AS l
    ON  p.product_id = l.product_id
    AND l.rn = 1;
