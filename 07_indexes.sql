-- =========================================================
-- Project: Clinical Trial Management & Analytics System
-- File: 07_indexes.sql
-- Purpose: Improve query performance using indexes
-- =========================================================


-- ---------------------------------------------------------
-- Index on enrollments.trial_id
-- Purpose: Speed up queries filtering or joining by trial_id
-- ---------------------------------------------------------
CREATE INDEX idx_trial_id_enrollments 
ON enrollments(trial_id);


-- ---------------------------------------------------------
-- Index on enrollments.patient_id
-- Purpose: Optimize patient-based lookup and join operations
-- ---------------------------------------------------------
CREATE INDEX idx_patient_id_enrollments 
ON enrollments(patient_id);


-- ---------------------------------------------------------
-- Index on adverse_events.trial_id
-- Purpose: Improve performance of safety and
--          pharmacovigilance-related queries
-- ---------------------------------------------------------
CREATE INDEX idx_trial_id_adverse_events 
ON adverse_events(trial_id);
