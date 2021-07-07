-- when there are already null values in the database
-- update course
-- set subject_id = '4ccc5db7-fe96-41f8-b900-d2c80af8c886'
-- where subject_id is null; 

ALTER TABLE course
ALTER COLUMN subject_id SET NOT NULL;
