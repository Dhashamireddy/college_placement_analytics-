
INSERT INTO student_skills (
    student_id,
    skill_id,
    proficiency_level,
    acquired_date
)
SELECT
    s.student_id,
    sk.skill_id,
    v.proficiency_level,
    DATE '2025-01-15'
FROM (
    VALUES
    ('NST001', 'Python', 'Advanced'),
    ('NST001', 'Data Structures', 'Advanced'),
    ('NST001', 'JavaScript', 'Intermediate'),
    ('NST001', 'React', 'Intermediate'),

    ('NST002', 'Java', 'Advanced'),
    ('NST002', 'Data Structures', 'Intermediate'),
    ('NST002', 'SQL', 'Beginner'),

    ('NST003', 'Python', 'Intermediate'),
    ('NST003', 'HTML', 'Intermediate'),
    ('NST003', 'CSS', 'Intermediate'),

    ('NST004', 'Python', 'Advanced'),
    ('NST004', 'Algorithms', 'Advanced'),
    ('NST004', 'Machine Learning', 'Intermediate'),

    ('NST005', 'Java', 'Intermediate'),
    ('NST005', 'MySQL', 'Intermediate'),
    ('NST005', 'Communication', 'Advanced'),

    ('NST006', 'JavaScript', 'Intermediate'),
    ('NST006', 'React', 'Beginner'),
    ('NST006', 'CSS', 'Intermediate'),

    ('NST007', 'Python', 'Intermediate'),
    ('NST007', 'PostgreSQL', 'Intermediate'),
    ('NST007', 'Data Structures', 'Intermediate'),

    ('NST008', 'Python', 'Advanced'),
    ('NST008', 'Machine Learning', 'Advanced'),
    ('NST008', 'Algorithms', 'Intermediate'),

    ('NST009', 'Java', 'Intermediate'),
    ('NST009', 'Node.js', 'Intermediate'),
    ('NST009', 'Express.js', 'Intermediate'),

    ('NST010', 'Python', 'Beginner'),
    ('NST010', 'HTML', 'Intermediate'),

    ('NST011', 'Java', 'Advanced'),
    ('NST011', 'Data Structures', 'Intermediate'),
    ('NST011', 'PostgreSQL', 'Intermediate'),

    ('NST012', 'JavaScript', 'Advanced'),
    ('NST012', 'React', 'Advanced'),
    ('NST012', 'HTML', 'Advanced'),
    ('NST012', 'CSS', 'Advanced'),

    ('NST013', 'Python', 'Intermediate'),
    ('NST013', 'Node.js', 'Beginner'),
    ('NST013', 'PostgreSQL', 'Intermediate'),

    ('NST014', 'Java', 'Intermediate'),
    ('NST014', 'Communication', 'Advanced'),

    ('NST015', 'JavaScript', 'Intermediate'),
    ('NST015', 'React', 'Beginner'),
    ('NST015', 'Communication', 'Advanced')

) AS v(usn, skill_name, proficiency_level)

JOIN students s
    ON s.usn = v.usn

JOIN skills sk
    ON sk.skill_name = v.skill_name;

SELECT
    s.usn,
    s.first_name,
    sk.skill_name,
    ss.proficiency_level
FROM student_skills ss
JOIN students s ON ss.student_id = s.student_id
JOIN skills sk ON ss.skill_id = sk.skill_id
ORDER BY s.usn, sk.skill_name;
