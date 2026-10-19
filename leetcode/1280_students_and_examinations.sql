-- LeetCode 1280: Students and Examinations
-- https://leetcode.com/problems/students-and-examinations/
-- Difficulty: Easy · Dialect: MySQL
-- Tables: Students (student_id, student_name), Subjects (subject_name),
--         Examinations (student_id, subject_name)
-- Approach:
--   1. CROSS JOIN builds every student × subject pair, so subjects never attended still appear.
--   2. LEFT JOIN attaches matching exams on BOTH student and subject; unmatched pairs get NULLs.
--   3. COUNT(e.subject_name) skips NULLs → 0 for no exams.

SELECT stud.student_id,
       stud.student_name,
       sub.subject_name,
       COUNT(e.subject_name) AS attended_exams
FROM Students AS stud
CROSS JOIN Subjects AS sub
LEFT JOIN Examinations AS e
    ON  stud.student_id = e.student_id
    AND sub.subject_name = e.subject_name
GROUP BY stud.student_id, stud.student_name, sub.subject_name
ORDER BY stud.student_id, sub.subject_name;
