-- when there are already null values in the database
-- update course
-- set teacher_id = 'fa2ffb7b-e6f5-459a-92d8-676bc48de094'
-- where teacher_id is null; 
-- 
ALTER TABLE course
ALTER COLUMN teacher_id SET NOT NULL;
