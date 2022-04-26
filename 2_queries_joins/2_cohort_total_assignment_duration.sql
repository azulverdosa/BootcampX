-- Get the total amount of time that all students from a specific cohort have spent on all assignments.
-- This should work for any cohort but use FEB12 for now.
-- Select only the total amount of time as a single column.
-- You can write as many JOIN statements as you need in a single query. 

SELECT SUM(duration) as total_duration
FROM assignment_submissions as subm
JOIN students as stu ON student_id = stu.id
JOIN cohorts as coh ON cohort_id = coh.id
WHERE coh.name = 'FEB12';
