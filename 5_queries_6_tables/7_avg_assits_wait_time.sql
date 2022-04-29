-- Calculate the average time it takes to start an assistance request.
-- This is the duration between an assistance request being created, and it being started.
-- Return just a single column here.

SELECT AVG(started_at - created_at)
FROM assistance_requests;