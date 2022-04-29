-- Get the cohort with the longest average duration of assistance requests.
-- The same requirements as the previous query, but only return the single row with the longest average.


SELECT MAX(average_assistance_request_duration) as longest_request_duration
FROM (
  SELECT AVG(completed_at - started_at) as average_assistance_request_duration
  FROM assistance_requests
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.id = cohort_id
  GROUP BY cohorts.name
) as longest_assistance_req;