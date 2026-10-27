# SQL Practice

My solutions to SQL exercises, written while learning SQL for data analytics and engineering.
Each file includes the problem link, the table schema, and short notes on my approach.

## Progress

| Source | Solved |
|---|---|
| [SQLBolt](https://sqlbolt.com) | ✅ 18 / 18 |
| [Select Star SQL](https://selectstarsql.com) | ✅ Completed — [notes](select-star-sql/NOTES.md) |
| [Kaggle Learn: Intro to SQL](https://www.kaggle.com/learn/intro-to-sql) | ✅ Certificate |
| [LeetCode Top SQL 50](https://leetcode.com/studyplan/top-sql-50/) | 16 / 50 |
| [DataLemur](https://datalemur.com) | 5 |

## Topics covered

- **Filtering:** `WHERE`, `BETWEEN`, `IN`, `LIKE` with `%` / `_` wildcards
- **Sorting & pagination:** `ORDER BY`, `LIMIT`, `OFFSET`, `DISTINCT`
- **Joins:** `INNER`, `LEFT`, `CROSS` and self-joins; join conditions in `ON` vs filters in `WHERE`
- **Anti-join:** `LEFT JOIN ... WHERE key IS NULL`, `NOT EXISTS`, and why `NOT IN` fails with NULLs
- **NULL handling:** `IS NULL`, `COALESCE` / `IFNULL`, why `NULL != x` is never TRUE, `COUNT(*)` vs `COUNT(column)`
- **Aggregation:** `COUNT`, `SUM`, `AVG`, `MAX`, `GROUP BY`, `HAVING` vs `WHERE`, "has all of X" pattern
- **Conditional aggregation:** `SUM/AVG(CASE WHEN ...)` for counts and rates, weighted averages
- **Dates:** `DATEDIFF`, date arithmetic and casting in PostgreSQL, index-friendly date ranges
- **Expressions & functions:** computed columns, aliases, integer vs decimal division, `ROUND`, `CHAR_LENGTH` vs `LENGTH`
- **Query execution order:** why `SELECT` aliases work in `ORDER BY` but not in `WHERE`
- **Modifying data:** `INSERT`, `UPDATE`, `DELETE` (verify the `WHERE` with a `SELECT` first)
- **Schema:** `CREATE TABLE`, `ALTER TABLE`, `DROP TABLE`, primary & foreign keys

## LeetCode Top SQL 50

| # | Problem | Difficulty | Key concept |
|---|---|---|---|
| 1757 | [Recyclable and Low Fat Products](leetcode/1757_recyclable_and_low_fat_products.sql) | Easy | Filtering with `AND` |
| 584 | [Find Customer Referee](leetcode/584_find_customer_referee.sql) | Easy | `NULL` in comparisons |
| 595 | [Big Countries](leetcode/595_big_countries.sql) | Easy | `OR` conditions |
| 1148 | [Article Views I](leetcode/1148_article_views_i.sql) | Easy | `DISTINCT`, aliases |
| 1683 | [Invalid Tweets](leetcode/1683_invalid_tweets.sql) | Easy | `CHAR_LENGTH` vs `LENGTH` (UTF-8) |
| 1378 | [Replace Employee ID With The Unique Identifier](leetcode/1378_replace_employee_id_with_unique_identifier.sql) | Easy | `LEFT JOIN` |
| 1068 | [Product Sales Analysis I](leetcode/1068_product_sales_analysis_i.sql) | Easy | `INNER JOIN` on a foreign key |
| 1581 | [Customer Who Visited but Did Not Make Any Transactions](leetcode/1581_customer_who_visited_but_did_not_make_any_transactions.sql) | Easy | Anti-join + `GROUP BY` |
| 197 | [Rising Temperature](leetcode/197_rising_temperature.sql) | Easy | Self-join, `DATEDIFF` |
| 1661 | [Average Time of Process per Machine](leetcode/1661_average_time_of_process_per_machine.sql) | Easy | Self-join on a composite key |
| 577 | [Employee Bonus](leetcode/577_employee_bonus.sql) | Easy | `LEFT JOIN` + `NULL` filter |
| 1280 | [Students and Examinations](leetcode/1280_students_and_examinations.sql) | Easy | `CROSS JOIN`, `COUNT(column)` |
| 570 | [Managers with at Least 5 Direct Reports](leetcode/570_managers_with_at_least_5_direct_reports.sql) | Medium | Self-join + `HAVING` |
| 1934 | [Confirmation Rate](leetcode/1934_confirmation_rate.sql) | Medium | Conditional aggregation |
| 620 | [Not Boring Movies](leetcode/620_not_boring_movies.sql) | Easy | Filtering, `%` |
| 1251 | [Average Selling Price](leetcode/1251_average_selling_price.sql) | Easy | Range join, weighted average |

## DataLemur

| Problem | Company | Difficulty | Key concept |
|---|---|---|---|
| [Data Science Skills](datalemur/data_science_skills.sql) | LinkedIn | Easy | "Has all of X": `GROUP BY` + `HAVING COUNT(DISTINCT)` |
| [Page With No Likes](datalemur/page_with_no_likes.sql) | Facebook | Easy | Anti-join |
| [Unfinished Parts](datalemur/unfinished_parts.sql) | Tesla | Easy | `IS NULL` |
| [Laptop vs. Mobile Viewership](datalemur/laptop_vs_mobile_viewership.sql) | New York Times | Easy | Conditional aggregation |
| [Average Post Hiatus (Part 1)](datalemur/average_post_hiatus_part_1.sql) | Facebook | Easy | Date arithmetic, sargable date filter |

## SQLBolt solutions

| # | Lesson | Key concept |
|---|---|---|
| 01 | [SELECT queries](sqlbolt/01_select_queries.sql) | Selecting columns |
| 02 | [Queries with constraints (Pt. 1)](sqlbolt/02_queries_with_constraints_1.sql) | `WHERE`, `BETWEEN` |
| 03 | [Queries with constraints (Pt. 2)](sqlbolt/03_queries_with_constraints_2.sql) | `LIKE`, wildcards |
| 04 | [Filtering & sorting](sqlbolt/04_filtering_sorting.sql) | `DISTINCT`, `ORDER BY`, `LIMIT` |
| 05 | [Simple SELECT review](sqlbolt/05_simple_select_review.sql) | Combining clauses |
| 06 | [JOINs](sqlbolt/06_joins.sql) | `INNER JOIN` |
| 07 | [OUTER JOINs](sqlbolt/07_outer_joins.sql) | `LEFT JOIN` |
| 08 | [NULLs](sqlbolt/08_nulls.sql) | `IS NULL`, anti-join |
| 09 | [Expressions](sqlbolt/09_expressions.sql) | Computed columns, aliases |
| 10 | [Aggregates (Pt. 1)](sqlbolt/10_aggregates_1.sql) | `GROUP BY` |
| 11 | [Aggregates (Pt. 2)](sqlbolt/11_aggregates_2.sql) | `HAVING` vs `WHERE` |
| 12 | [Order of execution](sqlbolt/12_order_of_execution.sql) | Logical query order |
| 13 | [Inserting rows](sqlbolt/13_insert.sql) | `INSERT`, primary keys |
| 14 | [Updating rows](sqlbolt/14_update.sql) | `UPDATE`, escaping quotes |
| 15 | [Deleting rows](sqlbolt/15_delete.sql) | `DELETE`, orphan rows |
| 16 | [Creating tables](sqlbolt/16_create_table.sql) | `CREATE TABLE`, constraints |
| 17 | [Altering tables](sqlbolt/17_alter_table.sql) | `ALTER TABLE`, defaults |
| 18 | [Dropping tables](sqlbolt/18_drop_table.sql) | `DROP TABLE` |

## Notes

- SQLBolt runs on SQLite, LeetCode on MySQL and DataLemur on PostgreSQL, so some solutions
  include comments on where the dialects behave differently.
- String literals use single quotes; columns are table-qualified in multi-table queries.
