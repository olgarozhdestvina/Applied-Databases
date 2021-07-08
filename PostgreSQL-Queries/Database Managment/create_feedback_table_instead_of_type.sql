CREATE TABLE feedback (
    student_id UUID NOT NULL REFERENCES student(student_id),
    course_id UUID NOT NULL REFERENCES course(course_id),
    feedback TEXT,
    rating rating,
    CONSTRAINT pk_feedback PRIMARY KEY (student_id, course_id)
);