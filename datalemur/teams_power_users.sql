-- DataLemur: Teams Power Users (Microsoft)
-- https://datalemur.com/questions/teams-power-users
-- Difficulty: Easy · Dialect: PostgreSQL
-- Table: messages (message_id, sender_id, receiver_id, content, sent_date)
-- Approach: Keep August 2022 messages with an index-friendly date range, count per sender,
--           sort descending and take the top 2.
-- Ties: the problem guarantees none; otherwise LIMIT 2 would cut ties arbitrarily
--       and DENSE_RANK() would be the safer choice.

SELECT sender_id, COUNT(message_id) AS message_count
FROM messages
WHERE sent_date >= '2022-08-01'
  AND sent_date <  '2022-09-01'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;
