-- DataLemur: Cities With Completed Trades (Robinhood)
-- https://datalemur.com/questions/completed-trades
-- Difficulty: Easy · Dialect: PostgreSQL
-- Tables: trades (order_id, user_id, quantity, status, date, price),
--         users (user_id, city, email, signup_date)
-- Approach: Join trades to users for the city, keep completed trades,
--           count orders per city, and take the top 3.
--           COUNT(t.order_id) states what is being counted (orders), not a side column.

SELECT u.city, COUNT(t.order_id) AS total_orders
FROM trades AS t
INNER JOIN users AS u
    ON t.user_id = u.user_id
WHERE t.status = 'Completed'
GROUP BY u.city
ORDER BY total_orders DESC
LIMIT 3;
