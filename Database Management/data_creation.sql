INSERT INTO student (
    first_name,
    last_name,
    email,
    date_of_birth
) VALUES (
    'David',
    'Hanson',
    'davidhanson.c@gmail.com',
    '1992-11-01'::DATE    
)

INSERT INTO teacher (
    first_name,
    last_name,
    email,
    date_of_birth
) VALUES (
    'David',
    'Hanson',
    'davidhanson.c@gmail.com',
    '1992-11-01'::DATE    
)

INSERT INTO subject (
    subject,
    description
) VALUES (
    'SQL Zero to Mastery',
    'The art of SQL Mastery'
)

DELETE FROM subject WHERE subject = 'SQL Zero to Mastery';

INSERT INTO subject (
    subject,
    description
) VALUES (
    'SQL',
    'A database management language'
)

INSERT INTO course (
    "name",
    description
) VALUES (
    'SQL Zero to Mastery',
    'The #1 resource for SQL mastery'
)

UPDATE course
SET subject_id = '52030c27-d47c-407a-bd68-5c458543269c'
WHERE subject_id IS NULL;

ALTER TABLE course ALTER COLUMN subject_id SET NOT NULL;

UPDATE course
SET teacher_id = 'c8c68bec-4b73-4632-873d-c08819a23f05'
WHERE teacher_id IS NULL;

ALTER TABLE course ALTER COLUMN teacher_id SET NOT NULL;

INSERT INTO enrollment (student_id, course_id, enrollment_date)
VALUES (
    '1edf8628-5814-4a04-99eb-fbbaf7af2492',
    'c81746e2-2139-4e22-ae76-bb4ef223633e',
    NOW()::DATE
)

UPDATE course
SET feedback = array_append(
    feedback,
    ROW(
        '1edf8628-5814-4a04-99eb-fbbaf7af2492',
        5,
        'this is my thoughtful feedback.'
    )::feedback
)
WHERE course_id = 'c81746e2-2139-4e22-ae76-bb4ef223633e';

CREATE TABLE feedback (
    student_id UUID NOT NULL REFERENCES student(student_id),
    course_id UUID NOT NULL REFERENCES course(course_id),
    feedback TEXT,
    rating rating,
    CONSTRAINT pk_feedback PRIMARY KEY (student_id, course_id)
)

INSERT INTO feedback (
    student_id,
    course_id,
    feedback,
    rating
) Values (
    '1edf8628-5814-4a04-99eb-fbbaf7af2492',
    'c81746e2-2139-4e22-ae76-bb4ef223633e',
    'This is my really good feedback',
    5
)