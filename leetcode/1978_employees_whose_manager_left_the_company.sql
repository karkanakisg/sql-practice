-- LeetCode 1978: Employees Whose Manager Left the Company
-- https://leetcode.com/problems/employees-whose-manager-left-the-company/
-- Difficulty: Easy · Dialect: MySQL
-- Table: Employees (employee_id, name, manager_id, salary)
-- Approach: Low earners whose manager_id no longer exists among employee_ids.
--   - NOT IN is safe here: the subquery returns employee_id (primary key, never NULL).
--     The NOT IN trap is a NULL INSIDE the subquery result, which makes it match nothing.
--   - manager_id IS NOT NULL is technically redundant (NULL NOT IN (...) is never TRUE)
--     but states the intent: no manager ≠ manager left.
-- Alternative (NULL-safe in general):
--   AND NOT EXISTS (SELECT 1 FROM Employees AS m WHERE m.employee_id = e.manager_id)

SELECT employee_id
FROM Employees
WHERE salary < 30000
  AND manager_id IS NOT NULL
  AND manager_id NOT IN (SELECT employee_id FROM Employees)
ORDER BY employee_id;
