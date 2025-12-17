-- =========================================================
-- Project: Clinical Trial Management & Analytics System
-- File: 05_views.sql
-- Purpose: Create reusable views for reporting and analysis
-- =========================================================


-- ---------------------------------------------------------
-- View: trial_enrollment_summary
-- Purpose: Provide a consolidated summary of patient
--          enrollment per clinical trial
-- ---------------------------------------------------------
CREATE VIEW trial_enrollment_summary AS
SELECT t.trial_id,
       t.title,
       t.phase,
       COUNT(e.patient_id) AS total_enrollments
FROM trials t
LEFT JOIN enrollments e 
    ON t.trial_id = e.trial_id
GROUP BY t.trial_id, t.title, t.phase;


-- Verify the trial enrollment summary view
SELECT * 
FROM trial_enrollment_summary;


-- ---------------------------------------------------------
-- View: safety_monitoring_view
-- Purpose: Support pharmacovigilance by providing
--          adverse event details per clinical trial
-- ---------------------------------------------------------
CREATE VIEW safety_monitoring_view AS
SELECT t.trial_id,
       t.title,
       a.event_term,
       a.severity,
       a.event_date
FROM trials t
JOIN adverse_events a 
    ON t.trial_id = a.trial_id;


-- Verify the safety monitoring view
SELECT * 
FROM safety_monitoring_view;
