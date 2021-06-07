SELECT emp_no,
    count(salary) OVER(
        ORDER BY emp_no
    ) "number_of_salaries" 
FROM salaries;