SELECT emp_no, salary, from_date
FROM salaries s
WHERE from_date = (
    SELECT max(s2.from_date)
    FROM salaries s2
    WHERE s2.emp_no = s.emp_no
)
ORDER BY emp_no;