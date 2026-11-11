
CREATE TABLE student_skills (
    student_id INTEGER NOT NULL,
    skill_id INTEGER NOT NULL,
    proficiency_level VARCHAR(30) DEFAULT 'Beginner'
        CHECK (
            proficiency_level IN (
                'Beginner',
                'Intermediate',
                'Advanced'
            )
        ),
    acquired_date DATE,

    PRIMARY KEY (student_id, skill_id),

    CONSTRAINT fk_student_skill_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    CONSTRAINT fk_student_skill_skill
        FOREIGN KEY (skill_id)
        REFERENCES skills(skill_id)
);
