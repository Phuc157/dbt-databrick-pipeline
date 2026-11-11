-- SELECT  COUNT(*) AS rows, COUNT( DISTINCT job_id) AS jobs
-- FROM dev.marts.fct_job_postings

SELECT job_schedule_type, COUNT(*)
FROM dev.staging.stg_job_postings
GROUP BY job_schedule_type
