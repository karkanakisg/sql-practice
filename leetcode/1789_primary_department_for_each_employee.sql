-- LeetCode 1789: Primary Department for Each Employee
-- https://leetcode.com/problems/primary-department-for-each-employee/
-- Difficulty: Easy · Dialect: MySQL
-- Table: Employee (employee_id, department_id, primary_flag ENUM('Y','N'))
-- Approach: One row per employee via GROUP BY, choosing the department with conditional aggregation:
--   - single department → MAX(department_id) simply returns it (aggregate required after GROUP BY);
--   - several departments → CASE keeps only the 'Y' department, others become NULL, MAX ignores NULLs.
--   The final IS NOT NULL is defensive: it would drop an employee with several departments and no 'Y',
--   which the problem guarantees never happens.
-- Alternative: WHERE primary_flag = 'Y' OR employee_id IN (employees with exactly one department)

WITH dept AS (
    SELECT employee_id,
           CASE
               WHEN COUNT(*) = 1 THEN MAX(department_id)
               ELSE MAX(CASE WHEN primary_flag = 'Y' THEN department_id END)
           END AS department_id
    FROM Employee
    GROUP BY employee_id
)

SELECT employee_id, department_id
FROM dept
WHERE department_id IS NOT NULL;
