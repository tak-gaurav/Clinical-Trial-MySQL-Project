CREATE VIEW trial_enrollment_summary AS
SELECT t.trial_id,
       t.title,
       t.phase,
       COUNT(e.patient_id) AS total_enrollments
FROM trials t
LEFT JOIN enrollments e ON t.trial_id = e.trial_id
GROUP BY t.trial_id, t.title, t.phase;

SELECT * FROM trial_enrollment_summary;

CREATE VIEW safety_monitoring_view AS
SELECT t.trial_id,
       t.title,
       a.event_term,
       a.severity,
       a.event_date
FROM trials t
JOIN adverse_events a ON t.trial_id = a.trial_id;

SELECT * FROM safety_monitoring_view;