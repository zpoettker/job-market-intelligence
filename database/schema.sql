-- Job Market Intelligence Platform
-- Schema: Table definitions
-- Run this first when setting up the database

CREATE TABLE companies (
    company_id INT PRIMARY KEY, 
    name VARCHAR(255) NOT NULL, 
    description TEXT, 
    company_size INT NOT NULL, 
    state VARCHAR(255), 
    country VARCHAR(255), 
    city VARCHAR(255), 
    zip_code VARCHAR(20), 
    address VARCHAR(255), 
    url VARCHAR(255)
);

CREATE TABLE postings (
    job_id INT PRIMARY KEY,
    company_id INT,
    title VARCHAR(255), 
    description TEXT, 
    location VARCHAR(255),
    max_salary DECIMAL(15,2),
    med_salary DECIMAL(15,2),
    min_salary DECIMAL(15,2),
    normalized_salary DECIMAL(15,2),
    pay_period VARCHAR(255),
    views INT,
    formatted_experience_level VARCHAR(50), 
    currency VARCHAR(255), 
    applies INT, 
    remote_allowed TINYINT(1), 
    listed_time BIGINT, 
    original_listed_time BIGINT, 
    expiry BIGINT, 
    sponsored TINYINT(1),
    work_type VARCHAR(255),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

CREATE TABLE skills (
    skill_abr VARCHAR(50) PRIMARY KEY,
    skill_name VARCHAR(255)
);

CREATE TABLE job_skills (
    job_id INT,
    skill_abr VARCHAR(50),
    PRIMARY KEY (job_id, skill_abr),
    FOREIGN KEY (job_id) REFERENCES postings(job_id),
    FOREIGN KEY (skill_abr) REFERENCES skills(skill_abr)
);