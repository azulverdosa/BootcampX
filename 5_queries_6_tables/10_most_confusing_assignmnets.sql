-- List each assignment with the total number of assistance requests with it.
-- Select the assignment's id, day, chapter, name and the total assistances.
-- Order by total assistances in order of most to least.

SELECT assignments.id, assignments.day, assignments.chapter, assignments.name, COUNT(assistance_requests.id) as total_assist_req
FROM assignments
JOIN assistance_requests ON assignments.id = assignment_id
GROUP BY assignments.id, assignments.day, assignments.chapter, assignments.name
ORDER BY total_assist_req DESC;