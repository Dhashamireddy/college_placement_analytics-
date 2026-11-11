
CREATE TABLE job_openings (
    job_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    company_id INTEGER NOT NULL,
    job_title VARCHAR(150) NOT NULL,
    job_description TEXT,
    job_location VARCHAR(150),
    employment_type VARCHAR(50),
    minimum_cgpa NUMERIC(3,2) NOT NULL DEFAULT 0
        CHECK (minimum_cgpa BETWEEN 0 AND 10),
    maximum_backlogs INTEGER NOT NULL DEFAULT 0
        CHECK (maximum_backlogs >= 0),
    package_lpa NUMERIC(6,2)
        CHECK (package_lpa >= 0),
    application_deadline DATE,
    job_status VARCHAR(30) NOT NULL DEFAULT 'Open'
        CHECK (job_status IN ('Open', 'Closed', 'On Hold')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_job_company
        FOREIGN KEY (company_id)
        REFERENCES companies(company_id)
);
