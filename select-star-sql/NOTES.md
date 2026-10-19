# Select Star SQL — Notes

Interactive SQL book by Zi Chong Kao: https://selectstarsql.com
Completed: October 2026

Works through one real-world dataset (Texas death-row executions, including last statements),
asking open-ended analytical questions instead of isolated exercises.

## What each chapter covered

| Chapter | Concepts |
|---|---|
| 1. Individual rows | `SELECT`, `WHERE`, `LIKE`, string functions (`LENGTH`), handling `NULL` values |
| 2. Aggregations | `COUNT`, `SUM`, `AVG`, `MAX`/`MIN`; `COUNT(*)` vs `COUNT(column)` with NULLs; conditional counting with `CASE WHEN` |
| 3. Grouping and nested queries | `GROUP BY`, `HAVING`, subqueries used as filters and derived values |
| 4. Joins and dates | Self-joins to compare a row with the previous one, date arithmetic (`julianday`) |

## Key takeaways

- Start from a question, then translate it into SQL — not the other way around.
- `COUNT(column)` skips NULLs while `COUNT(*)` counts every row; this changes results on messy data.
- `CASE WHEN` inside an aggregate lets one query compute several conditional counts.
- A self-join is how you compare each row with another row of the same table (e.g. time between events).

## Personal takeaway

- The questions were open-ended, so I had to decide what to query myself — harder than step-by-step exercises, but closer to real analysis.
