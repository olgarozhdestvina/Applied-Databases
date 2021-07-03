-- CREATE extension IF NOT EXISTS "uuid-ossp";

CREATE TABLE student (
student_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
date_of_birth DATE NOT NULL,
CONSTRAINT pk_student_id PRIMARY KEY (student_id)
);