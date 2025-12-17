-- =========================================================
-- Project: Clinical Trial Management & Analytics System
-- File: 02_schema.sql
-- Purpose: Define database schema (tables & relationships)
-- =========================================================


-- ---------------------------------------------------------
-- Table: trials
-- Purpose: Store core clinical trial information
-- ---------------------------------------------------------
CREATE TABLE trials (
    trial_id VARCHAR(20) PRIMARY KEY,              -- NCT-style trial identifier
    title TEXT NOT NULL,                            -- Official trial title
    phase ENUM('Phase I','Phase II','Phase III','Phase IV') NOT NULL,
    indication VARCHAR(100) NOT NULL,               -- Disease/condition studied
    start_date DATE,                                -- Trial start date
    status ENUM('Recruiting','Completed','Terminated') NOT NULL
);


-- Verify structure of trials table
DESCRIBE trials;


-- ---------------------------------------------------------
-- Table: sites
-- Purpose: Store clinical trial sites (hospitals / centers)
-- ---------------------------------------------------------
CREATE TABLE sites (
    site_id INT AUTO_INCREMENT PRIMARY KEY,         -- Unique site identifier
    site_name VARCHAR(150) NOT NULL,                 -- Hospital or institute name
    city VARCHAR(50),
    country VARCHAR(50)
);


-- ---------------------------------------------------------
-- Table: investigators
-- Purpose: Store investigator details linked to sites
-- ---------------------------------------------------------
CREATE TABLE investigators (
    investigator_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique investigator ID
    investigator_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    site_id INT,
    FOREIGN KEY (site_id) REFERENCES sites(site_id)  -- Link investigator to site
);


-- ---------------------------------------------------------
-- Table: patients (initial attempt - dropped due to keyword issue)
-- ---------------------------------------------------------
-- 'condition' is a reserved keyword in MySQL, so this table
-- definition was dropped and recreated with a safer column name
DROP TABLE IF EXISTS patients;


-- ---------------------------------------------------------
-- Table: patients
-- Purpose: Store anonymized patient demographic data
-- ---------------------------------------------------------
CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,      -- Anonymized patient ID
    gender ENUM('Male','Female','Other'),
    birth_year YEAR,
    medical_condition VARCHAR(100)                  -- Disease/condition of patient
);


-- Verify structure of patients table
DESCRIBE patients;


-- ---------------------------------------------------------
-- Table: enrollments
-- Purpose: Map patients to trials (many-to-many relationship)
-- ---------------------------------------------------------
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    trial_id VARCHAR(20),
    enrollment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (trial_id) REFERENCES trials(trial_id)
);


-- ---------------------------------------------------------
-- Table: adverse_events
-- Purpose: Store adverse event data for pharmacovigilance
-- ---------------------------------------------------------
CREATE TABLE adverse_events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    trial_id VARCHAR(20),
    event_term VARCHAR(100),                         -- Medical term for event
    severity ENUM('Mild','Moderate','Severe'),
    event_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (trial_id) REFERENCES trials(trial_id)
);


-- ---------------------------------------------------------
-- Table: trial_results
-- Purpose: Store summarized outcomes of clinical trials
-- ---------------------------------------------------------
CREATE TABLE trial_results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    trial_id VARCHAR(20),
    primary_outcome VARCHAR(200),                    -- Main outcome description
    success_rate DECIMAL(5,2),                       -- Percentage success rate
    FOREIGN KEY (trial_id) REFERENCES trials(trial_id)
);


-- ---------------------------------------------------------
-- Display all tables to verify successful schema creation
-- ---------------------------------------------------------
SHOW TABLES;
