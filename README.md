# SQL Practice

My solutions to SQL exercises, written while learning SQL for data analytics and engineering.
Each file includes the problem link, the table schema, and short notes on my approach.

## Progress

| Source | Solved |
|---|---|
| [SQLBolt](https://sqlbolt.com) | 12 / 18 |
| [LeetCode Top SQL 50](https://leetcode.com/studyplan/top-sql-50/) | 0 / 50 |
| [DataLemur](https://datalemur.com) | 0 |

## Topics covered

- **Filtering:** `WHERE`, `BETWEEN`, `IN`, `LIKE` with `%` / `_` wildcards
- **Sorting & pagination:** `ORDER BY`, `LIMIT`, `OFFSET`, `DISTINCT`
- **Joins:** `INNER JOIN`, `LEFT JOIN`, anti-join pattern (`LEFT JOIN ... WHERE key IS NULL`)
- **NULL handling:** `IS NULL` / `IS NOT NULL`
- **Expressions:** computed columns, aliases, integer vs decimal division
- **Aggregation:** `COUNT`, `SUM`, `AVG`, `MAX`, `GROUP BY`, `HAVING` vs `WHERE`
- **Query execution order:** why `SELECT` aliases work in `ORDER BY` but not in `WHERE`

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

## Notes

- SQLBolt runs on SQLite, so some solutions may include comments on where standard SQL
  (e.g. PostgreSQL) behaves differently.
- String literals use single quotes; columns are table-qualified in multi-table queries.
