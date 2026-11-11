
CREATE TABLE students (
    student_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    usn VARCHAR(30) NOT NULL UNIQUE,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(20),
    department_id INTEGER NOT NULL,
    graduation_year INTEGER NOT NULL,
    cgpa NUMERIC(3,2) NOT NULL CHECK (cgpa BETWEEN 0 AND 10),
    backlogs INTEGER NOT NULL DEFAULT 0 CHECK (backlogs >= 0),
    enrollment_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_student_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);
