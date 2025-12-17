INSERT INTO trials VALUES
('NCT04382066',
 'A Study of Remdesivir in Hospitalized Adults with COVID-19',
 'Phase III',
 'COVID-19',
 '2020-05-01',
 'Completed'),

('NCT04647623',
 'Efficacy of Tirzepatide in Type 2 Diabetes Mellitus',
 'Phase III',
 'Type 2 Diabetes Mellitus',
 '2021-01-15',
 'Completed'),

('NCT05197834',
 'Safety and Efficacy of Semaglutide in Obesity',
 'Phase II',
 'Obesity',
 '2022-03-10',
 'Recruiting');
 
 SELECT * FROM trials;

INSERT INTO sites (site_name, city, country) VALUES
('AIIMS New Delhi', 'New Delhi', 'India'),
('PGIMER Chandigarh', 'Chandigarh', 'India'),
('Apollo Hospitals', 'Chennai', 'India');

SELECT * FROM sites;

INSERT INTO investigators (investigator_name, specialization, site_id) VALUES
('Dr. Randeep Guleria', 'Pulmonology', 1),
('Dr. Yogesh Bahurupi', 'Endocrinology', 2),
('Dr. V. Mohan', 'Diabetology', 3);

SELECT * FROM investigators;

INSERT INTO patients (gender, birth_year, medical_condition) VALUES
('Male', 1975, 'COVID-19'),
('Female', 1982, 'Type 2 Diabetes Mellitus'),
('Male', 1990, 'Obesity'),
('Female', 1968, 'Type 2 Diabetes Mellitus');

SELECT * FROM patients;

INSERT INTO enrollments (patient_id, trial_id, enrollment_date) VALUES
(1, 'NCT04382066', '2020-06-01'),
(2, 'NCT04647623', '2021-02-20'),
(3, 'NCT05197834', '2022-04-05'),
(4, 'NCT04647623', '2021-03-10');

SELECT * FROM enrollments;

INSERT INTO adverse_events (patient_id, trial_id, event_term, severity, event_date) VALUES
(1, 'NCT04382066', 'Elevated liver enzymes', 'Moderate', '2020-06-15'),
(2, 'NCT04647623', 'Nausea', 'Mild', '2021-03-01'),
(3, 'NCT05197834', 'Headache', 'Mild', '2022-04-20'),
(4, 'NCT04647623', 'Hypoglycemia', 'Severe', '2021-04-02');

SELECT * FROM adverse_events;

INSERT INTO trial_results (trial_id, primary_outcome, success_rate) VALUES
('NCT04382066', 'Reduction in recovery time', 78.50),
('NCT04647623', 'Improved glycemic control (HbA1c)', 82.30);

SELECT * FROM trial_results;