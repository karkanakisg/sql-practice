-- LeetCode 596: Classes More Than 5 Students
-- https://leetcode.com/problems/classes-more-than-5-students/
-- Difficulty: Easy · Dialect: MySQL
-- Table: Courses (student, class), PK (student, class)
-- Approach: Group by class and keep groups with at least 5 students using HAVING.
--           (student, class) is the primary key, so no duplicates; without that guarantee,
--           COUNT(DISTINCT student) would be the safe choice.

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;
