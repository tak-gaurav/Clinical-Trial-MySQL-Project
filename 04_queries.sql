-- =========================================================
-- Project: Clinical Trial Management & Analytics System
-- File: 04_queries.sql
-- Purpose: Perform analytical queries on clinical trial data
-- =========================================================


-- ---------------------------------------------------------
-- Retrieve all clinical trials
-- ---------------------------------------------------------
SELECT * 
FROM trials;


-- ---------------------------------------------------------
-- Count number of clinical trials by phase
-- ---------------------------------------------------------
SELECT phase, 
       COUNT(*) AS total_trials
FROM trials
GROUP BY phase;


-- ---------------------------------------------------------
-- Calculate patient enrollment count per clinical trial
-- ---------------------------------------------------------
SELECT t.trial_id, 
       t.title, 
       COUNT(e.patient_id) AS enrolled_patients
FROM trials t
JOIN enrollments e 
    ON t.trial_id = e.trial_id
GROUP BY t.trial_id, t.title;


-- ---------------------------------------------------------
-- Count adverse events reported per clinical trial
-- ---------------------------------------------------------
SELECT t.trial_id, 
       COUNT(a.event_id) AS adverse_event_count
FROM trials t
LEFT JOIN adverse_events a 
    ON t.trial_id = a.trial_id
GROUP BY t.trial_id;


-- ---------------------------------------------------------
-- Identify trials that reported severe adverse events
-- ---------------------------------------------------------
SELECT DISTINCT trial_id
FROM adverse_events
WHERE severity = 'Severe';


-- ---------------------------------------------------------
-- Map investigators to their respective clinical sites
-- ---------------------------------------------------------
SELECT i.investigator_name, 
       s.site_name
FROM investigators i
JOIN sites s 
    ON i.site_id = s.site_id;


-- ---------------------------------------------------------
-- Retrieve success rates for completed clinical trials
-- ---------------------------------------------------------
SELECT t.trial_id, 
       t.title, 
       r.success_rate
FROM trials t
JOIN trial_results r 
    ON t.trial_id = r.trial_id
WHERE t.status = 'Completed';


-- ---------------------------------------------------------
-- Calculate average patient age per clinical trial
-- ---------------------------------------------------------
SELECT e.trial_id,
       AVG(YEAR(CURDATE()) - p.birth_year) AS avg_patient_age
FROM enrollments e
JOIN patients p 
    ON e.patient_id = p.patient_id
GROUP BY e.trial_id;


-- ---------------------------------------------------------
-- Identify trials with more than one reported adverse event
-- ---------------------------------------------------------
SELECT trial_id, 
       COUNT(*) AS event_count
FROM adverse_events
GROUP BY trial_id
HAVING COUNT(*) > 1;


-- ---------------------------------------------------------
-- Analyze patient enrollment by disease indication
-- ---------------------------------------------------------
SELECT t.indication, 
       COUNT(e.patient_id) AS total_enrollments
FROM trials t
JOIN enrollments e 
    ON t.trial_id = e.trial_id
GROUP BY t.indication;
