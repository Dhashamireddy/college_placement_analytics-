
CREATE TABLE interview_rounds (
    round_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    application_id INTEGER NOT NULL,
    round_number INTEGER NOT NULL CHECK (round_number > 0),
    round_name VARCHAR(100) NOT NULL,
    interview_date DATE,
    round_status VARCHAR(30) NOT NULL DEFAULT 'Pending'
        CHECK (
            round_status IN (
                'Pending',
                'Cleared',
                'Rejected'
            )
        ),
    feedback TEXT,

    CONSTRAINT fk_round_application
        FOREIGN KEY (application_id)
        REFERENCES applications(application_id),

    CONSTRAINT unique_application_round
        UNIQUE (application_id, round_number)
);
