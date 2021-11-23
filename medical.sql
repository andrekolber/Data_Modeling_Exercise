DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    sex TEXT NOT NULL CHECK (sex = 'Male' OR sex = 'Female'),
    age INTEGER NOT NULL
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors NOT NULL,
    patient_id INTEGER REFERENCES patients NOT NULL,
    date DATE
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits NOT NULL,
    disease_id INTEGER REFERENCES diseases,
    notes TEXT
);

INSERT INTO doctors (first_name, last_name)
VALUES
('Dr. William', 'Johnson'),
('Dr. Jane', 'Doe'),
('Dr. James', 'Wilkins');

INSERT INTO patients (first_name, last_name, sex, age)
VALUES
('Mary', 'Poppins', 'Female', 45),
('Michael', 'Renfrow', 'Male', 34),
('Haley', 'Sparks', 'Female', 21);

INSERT INTO visits (doctor_id, patient_id, date)
VALUES 
(1, 1, '2021-04-01'),
(2, 2, '2021-03-24'),
(3, 3, '2021-05-30');

INSERT INTO diseases (name, description)
VALUES
('Covid-19', 'COVID-19 is caused by a coronavirus called SARS-CoV-2. Older adults and people who have severe underlying medical conditions like heart or lung disease or diabetes seem to be at higher risk for developing more serious complications from COVID-19 illness.'),
('Cancer', 'A disease in which abnormal cells divide uncontrollably and destroy body tissue.'),
('Glaucoma', 'With all types of glaucoma, the nerve connecting the eye to the brain is damaged, usually due to high eye pressure.');

INSERT INTO diagnoses (visit_id, disease_id, notes)
VALUES
(1, 2, 'Patient has early stage cancer that is likely cureable with rapid treatment.'),
(2, 1, 'Patient has trouble breathing and a fever of 102 deg.'),
(3, 3, 'Patient has reduced vision clarity and needs further examination to determine severity of glaucoma.');
