CREATE TABLE trials (
    trial_id VARCHAR(20) PRIMARY KEY,
    title TEXT NOT NULL,
    phase ENUM('Phase I','Phase II','Phase III','Phase IV') NOT NULL,
    indication VARCHAR(100) NOT NULL,
    start_date DATE,
    status ENUM('Recruiting','Completed','Terminated') NOT NULL
);
DESCRIBE trials;

CREATE TABLE sites (
    site_id INT AUTO_INCREMENT PRIMARY KEY,
    site_name VARCHAR(150) NOT NULL,
    city VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE investigators (
    investigator_id INT AUTO_INCREMENT PRIMARY KEY,
    investigator_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    site_id INT,
    FOREIGN KEY (site_id) REFERENCES sites(site_id)
);

CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    gender ENUM('Male','Female','Other'),
    birth_year YEAR,
    condition VARCHAR(100)
);

DROP TABLE IF EXISTS patients;

CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    gender ENUM('Male','Female','Other'),
    birth_year YEAR,
    medical_condition VARCHAR(100)
);
DESCRIBE patients;

CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    trial_id VARCHAR(20),
    enrollment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (trial_id) REFERENCES trials(trial_id)
);

CREATE TABLE adverse_events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    trial_id VARCHAR(20),
    event_term VARCHAR(100),
    severity ENUM('Mild','Moderate','Severe'),
    event_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (trial_id) REFERENCES trials(trial_id)
);

CREATE TABLE trial_results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    trial_id VARCHAR(20),
    primary_outcome VARCHAR(200),
    success_rate DECIMAL(5,2),
    FOREIGN KEY (trial_id) REFERENCES trials(trial_id)
);

SHOW TABLES;