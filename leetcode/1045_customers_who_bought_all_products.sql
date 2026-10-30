-- LeetCode 1045: Customers Who Bought All Products
-- https://leetcode.com/problems/customers-who-bought-all-products/
-- Difficulty: Medium · Dialect: MySQL
-- Tables: Customer (customer_id, product_key), Product (product_key)
-- Approach: "Has all of X" pattern with a dynamic total —
--   group purchases per customer and keep customers whose number of DISTINCT products
--   equals the total number of products, taken from a scalar subquery.
--   DISTINCT: buying the same product twice must count once.
-- Lesson learned: the scalar subquery must return ONE value (COUNT(*)), not the product keys.

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product)
ORDER BY customer_id;
