-- LeetCode 1174: Immediate Food Delivery II
-- https://leetcode.com/problems/immediate-food-delivery-ii/
-- Difficulty: Medium · Dialect: MySQL
-- Table: Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date)
-- Approach: Keep only each customer's first order, then compute the share that was immediate.
--   - Subquery returns (customer_id, earliest order_date); the tuple IN keeps those rows.
--   - AVG of a 1/0 flag times 100 gives the percentage directly.
-- Alternative (portable, window function): number each customer's orders with
--   ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) and keep rn = 1.

SELECT ROUND(AVG(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100, 2)
       AS immediate_percentage
FROM Delivery
WHERE (customer_id, order_date) IN (
    SELECT customer_id, MIN(order_date)
    FROM Delivery
    GROUP BY customer_id
);
