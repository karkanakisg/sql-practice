-- LeetCode 1251: Average Selling Price
-- https://leetcode.com/problems/average-selling-price/
-- Difficulty: Easy · Dialect: MySQL
-- Tables: Prices (product_id, start_date, end_date, price),
--         UnitsSold (product_id, purchase_date, units)
-- Approach:
--   - Each sale must match the price period it falls in, so the date range is part of the
--     JOIN condition (ON), not a filter or CASE: otherwise every sale pairs with every period.
--   - Weighted average = total revenue / total units = SUM(price * units) / SUM(units);
--     a plain AVG(price) would ignore how many units sold at each price.
--   - LEFT JOIN keeps products with no sales; their division is NULL, so IFNULL(..., 0).
-- Lesson learned: first attempt put the date check inside CASE (and reversed it);
--                 the extra 0 rows dragged the average down.

SELECT p.product_id,
       IFNULL(ROUND(SUM(p.price * u.units) / SUM(u.units), 2), 0) AS average_price
FROM Prices AS p
LEFT JOIN UnitsSold AS u
    ON  p.product_id = u.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;
