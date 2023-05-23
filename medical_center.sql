DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;


\c medical_center

CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  name text,
  workplace text,
  position text,
  salary INTEGER
);

CREATE TABLE patient (
  id SERIAL PRIMARY KEY,
  name text,
  age INTEGER,
  sex text
);

CREATE TABLE visits (
  id SERIAL PRIMARY KEY,
  doc_id INTEGER,
  patient_id INTEGER,
  date text
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT,
    description TEXT
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits,
    disease_id INTEGER REFERENCES diseases
);