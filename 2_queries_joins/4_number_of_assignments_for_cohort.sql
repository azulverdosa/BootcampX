-- Select the number of assignment submissions for a cohort with a name
-- You can do multiple joins

SELECT count(assignment_submissions.id) as total_submissions_count
FROM assignment_submissions
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'FEB12';