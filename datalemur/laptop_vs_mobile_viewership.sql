-- DataLemur: Laptop vs. Mobile Viewership (New York Times)
-- https://datalemur.com/questions/laptop-mobile-viewership
-- Difficulty: Easy · Dialect: PostgreSQL
-- Table: viewership (user_id, device_type, view_time)
-- Approach: Conditional aggregation — each CASE turns a row into 1 or 0 for its category,
--           and SUM counts them, giving two separate totals in a single pass.
-- PostgreSQL alternative: COUNT(*) FILTER (WHERE device_type = 'laptop')

SELECT
    SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views,
    SUM(CASE WHEN device_type IN ('phone', 'tablet') THEN 1 ELSE 0 END) AS mobile_views
FROM viewership;
