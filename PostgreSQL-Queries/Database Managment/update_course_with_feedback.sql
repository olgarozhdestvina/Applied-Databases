UPDATE course
SET feedback = array_append (
    feedback,
    ROW (
        'c4ff704d-4e24-42f6-acc4-c5356c79f64d',
        5,
        'Great course'
    )::feedback
) WHERE course_id = '57b132c5-b436-4d7a-b018-a07fc43b4b49';