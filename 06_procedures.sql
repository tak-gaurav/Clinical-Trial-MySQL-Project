-- =========================================================
-- Project: Clinical Trial Management & Analytics System
-- File: 06_procedures.sql
-- Purpose: Define stored procedures for operational workflows
-- =========================================================


-- ---------------------------------------------------------
-- Procedure: enroll_patient
-- Purpose: Enroll a patient into a clinical trial in a
--          standardized and reusable manner
-- ---------------------------------------------------------

-- Change delimiter to allow procedure definition
DELIMITER $$

CREATE PROCEDURE enroll_patient (
    IN p_patient_id INT,            -- Patient identifier
    IN p_trial_id VARCHAR(20),       -- Clinical trial ID (NCT)
    IN p_enroll_date DATE            -- Enrollment date
)
BEGIN
    INSERT INTO enrollments (
        patient_id, 
        trial_id, 
        enrollment_date
    )
    VALUES (
        p_patient_id, 
        p_trial_id, 
        p_enroll_date
    );
END $$

-- Reset delimiter back to default
DELIMITER ;


-- Example call to enroll a patient into a trial
CALL enroll_patient(1, 'NCT05197834', '2022-05-01');


-- ---------------------------------------------------------
-- Procedure: log_adverse_event
-- Purpose: Record an adverse event for pharmacovigilance
--          and clinical safety monitoring
-- ---------------------------------------------------------

-- Change delimiter to allow procedure definition
DELIMITER $$

CREATE PROCEDURE log_adverse_event (
    IN p_patient_id INT,                 -- Patient identifier
    IN p_trial_id VARCHAR(20),            -- Clinical trial ID (NCT)
    IN p_event_term VARCHAR(100),         -- Adverse event description
    IN p_severity ENUM('Mild','Moderate','Severe'),
    IN p_event_date DATE                  -- Date of event
)
BEGIN
    INSERT INTO adverse_events (
        patient_id, 
        trial_id, 
        event_term, 
        severity, 
        event_date
    )
    VALUES (
        p_patient_id, 
        p_trial_id, 
        p_event_term, 
        p_severity, 
        p_event_date
    );
END $$

-- Reset delimiter back to default
DELIMITER ;


-- Example call to log an adverse event
CALL log_adverse_event(
    2, 
    'NCT04647623', 
    'Vomiting', 
    'Moderate', 
    '2021-04-10'
);
