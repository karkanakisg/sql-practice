-- LeetCode 1581: Customer Who Visited but Did Not Make Any Transactions
-- https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/
-- Difficulty: Easy · Dialect: MySQL
-- Tables: Visits (visit_id, customer_id), Transactions (transaction_id, visit_id, amount)
-- Approach: Anti-join, then aggregate.
--   1. LEFT JOIN keeps every visit; visits without a transaction get NULLs from Transactions.
--   2. WHERE t.transaction_id IS NULL keeps only those visits
--      (primary key → NULL only when there is no match).
--   3. GROUP BY customer_id + COUNT gives the number of such visits per customer.
-- Alternative: WHERE visit_id NOT IN (SELECT visit_id FROM Transactions)

SELECT v.customer_id, COUNT(v.visit_id) AS count_no_trans
FROM Visits AS v
LEFT JOIN Transactions AS t
    ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;
