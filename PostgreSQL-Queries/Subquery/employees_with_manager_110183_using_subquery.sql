SELECT emp_no, concat(first_name, ' ', last_name) "full_name"
FROM employees
WHERE emp_no IN (
    SELECT emp_no FROM dept_emp 
    WHERE dept_no = (
        SELECT dept_no FROM dept_manager
        WHERE emp_no = 110183 
));