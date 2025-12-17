DELIMITER $$

CREATE PROCEDURE enroll_patient (
    IN p_patient_id INT,
    IN p_trial_id VARCHAR(20),
    IN p_enroll_date DATE
)
BEGIN
    INSERT INTO enrollments (patient_id, trial_id, enrollment_date)
    VALUES (p_patient_id, p_trial_id, p_enroll_date);
END $$

DELIMITER ;

CALL enroll_patient(1, 'NCT05197834', '2022-05-01');

DELIMITER $$

CREATE PROCEDURE log_adverse_event (
    IN p_patient_id INT,
    IN p_trial_id VARCHAR(20),
    IN p_event_term VARCHAR(100),
    IN p_severity ENUM('Mild','Moderate','Severe'),
    IN p_event_date DATE
)
BEGIN
    INSERT INTO adverse_events (patient_id, trial_id, event_term, severity, event_date)
    VALUES (p_patient_id, p_trial_id, p_event_term, p_severity, p_event_date);
END $$

DELIMITER ;

CALL log_adverse_event(2, 'NCT04647623', 'Vomiting', 'Moderate', '2021-04-10');