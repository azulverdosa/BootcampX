-- Get the total number of assignments for each day of bootcamp.
-- Select the day and the total assignments.
-- Order the results by day.
-- This query only requires the assignments table.
-- Only return rows where total assignments is greater than or equal to 10.

SELECT day, COUNT(assignments.id) as total_assignments
FROM assignments
GROUP BY day
HAVING COUNT(assignments.id) >= 10
ORDER BY day ASC;