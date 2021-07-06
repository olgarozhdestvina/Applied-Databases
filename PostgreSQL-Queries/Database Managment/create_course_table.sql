CREATE TABLE course (
    course_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    "name" TEXT NOT NULL,
    description TEXT,
    subject_id UUID REFERENCES subject(subject_id),
    teacher_id UUID REFERENCES teacher(teacher_id),
    feedback feedback[]
);