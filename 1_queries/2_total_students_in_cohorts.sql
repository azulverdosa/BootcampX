-- Select the total number of students who were in the first 3 cohorts.

SELECT COUNT(name)
FROM students
WHERE cohort_id <= 3;