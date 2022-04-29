-- Calculate the average total duration of assistance requests for each cohort.
-- Use the previous query as a sub query to determine the duration per cohort.
-- Return a single row average_total_duration

SELECT AVG(total_req_duration)
FROM (
  SELECT cohorts.name as cohort, SUM(completed_at - started_at) as total_req_duration
  FROM assistance_requests
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.id = cohort_id
  GROUP BY cohorts.name
  ORDER BY total_req_duration
) as average_duration;