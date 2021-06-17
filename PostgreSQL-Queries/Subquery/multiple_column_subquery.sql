SELECT emp_no, salary, avg AS "Department average salary"
FROM salaries
JOIN dept_emp USING(emp_no)
JOIN (
    SELECT dept_no, avg(salary) FROM salaries
    JOIN dept_emp USING(emp_no)
    GROUP BY dept_no
) AS d USING(dept_no)
WHERE salary > avg
ORDER BY emp_no;