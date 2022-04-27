-- Get the students who's average time it takes to complete an assignment is less than 
-- the average estimated time it takes to complete an assignment.
-- Select the name of the student, their average completion time, and the average suggested completion time.
-- Order by average completion time from smallest to largest.
-- Only get currently enrolled students.
-- This will require data from students, assignment_submissions, and assignments. 

SELECT students.name as student_name, 
  AVG(assignment_submissions.duration) as avg_time,
  AVG(assignments.duration) as avg_suggested_time
FROM assignments 
JOIN assignment_submissions ON assignment_id = assignments.id
JOIN students ON student_id = students.id
WHERE students.end_date IS NULL -- students currently enrolled
GROUP BY students.name
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY AVG(assignment_submissions.duration) ASC;

