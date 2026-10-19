-- LeetCode 1068: Product Sales Analysis I
-- https://leetcode.com/problems/product-sales-analysis-i/
-- Difficulty: Easy · Dialect: MySQL
-- Tables: Sales (sale_id, product_id, year, quantity, price), Product (product_id, product_name)
-- Approach: Sales.product_id is a foreign key to Product, so every sale has a matching product;
--           INNER JOIN loses no rows here and is the natural choice.

SELECT p.product_name, s.year, s.price
FROM Sales AS s
INNER JOIN Product AS p
    ON s.product_id = p.product_id;
