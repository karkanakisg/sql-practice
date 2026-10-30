-- LeetCode 2356: Number of Unique Subjects Taught by Each Teacher
-- https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/
-- Difficulty: Easy · Dialect: MySQL
-- Table: Teacher (teacher_id, subject_id, dept_id), PK (subject_id, dept_id)
-- Approach: The same subject can be taught in several departments, so a teacher can have
--           repeated subject_ids; COUNT(DISTINCT subject_id) counts each subject once.

SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;
