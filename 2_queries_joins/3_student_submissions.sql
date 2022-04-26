-- Select the name of all assignments completed by the student with a name
-- You can do multiple joins

SELECT assignments.name
FROM students
JOIN assignment_submissions ON students.id = student_id
JOIN assignments ON assignments.id = assignment_id
WHERE students.name = 'Ibrahim Schimmel'
ORDER BY assignments.name asc;