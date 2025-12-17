SELECT * FROM trials;

SELECT phase, COUNT(*) AS total_trials
FROM trials
GROUP BY phase;

SELECT t.trial_id, t.title, COUNT(e.patient_id) AS enrolled_patients
FROM trials t
JOIN enrollments e ON t.trial_id = e.trial_id
GROUP BY t.trial_id, t.title;

SELECT t.trial_id, COUNT(a.event_id) AS adverse_event_count
FROM trials t
LEFT JOIN adverse_events a ON t.trial_id = a.trial_id
GROUP BY t.trial_id;

SELECT DISTINCT trial_id
FROM adverse_events
WHERE severity = 'Severe';

SELECT i.investigator_name, s.site_name
FROM investigators i
JOIN sites s ON i.site_id = s.site_id;

SELECT t.trial_id, t.title, r.success_rate
FROM trials t
JOIN trial_results r ON t.trial_id = r.trial_id
WHERE t.status = 'Completed';

SELECT e.trial_id,
       AVG(YEAR(CURDATE()) - p.birth_year) AS avg_patient_age
FROM enrollments e
JOIN patients p ON e.patient_id = p.patient_id
GROUP BY e.trial_id;

SELECT trial_id, COUNT(*) AS event_count
FROM adverse_events
GROUP BY trial_id
HAVING COUNT(*) > 1;

SELECT t.indication, COUNT(e.patient_id) AS total_enrollments
FROM trials t
JOIN enrollments e ON t.trial_id = e.trial_id
GROUP BY t.indication;