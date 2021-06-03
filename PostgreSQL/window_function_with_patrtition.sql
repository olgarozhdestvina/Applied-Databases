SELECT
    *,
    avg(salary) OVER(
        PARTITION BY dept_name
    ) "average_dept_salary"
FROM salaries
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
ORDER BY dept_no, emp_no;