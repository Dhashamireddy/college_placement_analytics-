
CREATE TABLE offers (
    offer_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    application_id INTEGER NOT NULL UNIQUE,
    offered_package_lpa NUMERIC(6,2) NOT NULL
        CHECK (offered_package_lpa > 0),
    offer_date DATE NOT NULL DEFAULT CURRENT_DATE,
    joining_date DATE,
    offer_status VARCHAR(30) NOT NULL DEFAULT 'Offered'
        CHECK (
            offer_status IN (
                'Offered',
                'Accepted',
                'Rejected',
                'Withdrawn'
            )
        ),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_offer_application
        FOREIGN KEY (application_id)
        REFERENCES applications(application_id)
);
