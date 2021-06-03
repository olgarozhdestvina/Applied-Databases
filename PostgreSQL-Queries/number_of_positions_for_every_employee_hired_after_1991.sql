SELECT emp_no, first_name, last_name, hire_date, count(title) "# of postions"
FROM employees
JOIN titles USING(emp_no)
WHERE EXTRACT(YEAR FROM hire_date) > '1991'
GROUP BY hire_date, emp_no
ORDER BY emp_no;