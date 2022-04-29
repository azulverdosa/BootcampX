-- Perform the same query as before, but include the number of assistances as well.

SELECT DISTINCT teachers.name as teacher,  teachers.name as cohort, COUNT(assistance_requests.id) as total_assists
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, teachers.name
ORDER BY teacher;