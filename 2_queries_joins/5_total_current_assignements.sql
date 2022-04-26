-- Get the total number of assignment submissions for all students in the current cohort.

SELECT count(assignment_submissions) as total_submissions
FROM assignment_submissions 
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL;