
CREATE TABLE applications (
    application_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_id INTEGER NOT NULL,
    job_id INTEGER NOT NULL,
    application_date DATE NOT NULL DEFAULT CURRENT_DATE,
    application_status VARCHAR(30) NOT NULL DEFAULT 'Applied'
        CHECK (
            application_status IN (
                'Applied',
                'Shortlisted',
                'Rejected',
                'Selected',
                'Withdrawn'
            )
        ),
    current_round INTEGER DEFAULT 0
        CHECK (current_round >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_application_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    CONSTRAINT fk_application_job
        FOREIGN KEY (job_id)
        REFERENCES job_openings(job_id),

    CONSTRAINT unique_student_job
        UNIQUE (student_id, job_id)
);
