SELECT emp_no, 
       concat(first_name, ' ', last_name) "full_name", 
       from_date, to_date, dept_name 
FROM employees 
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE dept_name = 'Development'