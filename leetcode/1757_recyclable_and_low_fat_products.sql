-- LeetCode 1757: Recyclable and Low Fat Products
-- https://leetcode.com/problems/recyclable-and-low-fat-products/
-- Difficulty: Easy · Dialect: MySQL
-- Table: Products (product_id, low_fats ENUM('Y','N'), recyclable ENUM('Y','N'))
-- Approach: Simple row filter; both conditions must hold, so combine them with AND.

SELECT product_id
FROM Products
WHERE low_fats = 'Y'
  AND recyclable = 'Y';
