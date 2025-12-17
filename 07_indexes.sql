CREATE INDEX idx_trial_id_enrollments ON enrollments(trial_id);
CREATE INDEX idx_patient_id_enrollments ON enrollments(patient_id);
CREATE INDEX idx_trial_id_adverse_events ON adverse_events(trial_id);