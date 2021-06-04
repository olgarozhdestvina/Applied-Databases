SELECT DISTINCT emp_no,
        concat(first_name, ' ', last_name) "full_name",
        dept_name,
        last_value( salary ) OVER (
            PARTITION BY emp_no
            ORDER BY s.from_date
            RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) "current_salary",
        last_value( s.from_date ) OVER (
            PARTITION BY emp_no
            ORDER BY s.from_date
            RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) "from_date"
FROM salaries s

JOIN employees USING(emp_no)
JOIN dept_emp USING(emp_no)
JOIN departments USING (dept_no)

ORDER BY emp_no;