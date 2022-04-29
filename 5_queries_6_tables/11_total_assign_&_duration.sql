-- Get each day with the total number of assignments and the total duration of the assignments.
-- Select the day, number of assignments, and the total duration of assignments.
-- Order the results by the day.

  SELECT assignments.day, COUNT(assignments.id) as daily_assign, SUM(assignments.duration) as duration_per_day
  FROM assignments
  GROUP BY assignments.day
  ORDER BY assignments.day;


