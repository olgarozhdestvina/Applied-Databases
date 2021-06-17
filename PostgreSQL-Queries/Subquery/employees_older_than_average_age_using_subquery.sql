SELECT  emp_no, 
        concat(first_name, ' ', last_name) "full_name", 
        age(birth_date)
FROM employees
WHERE age(birth_date) > (
    SELECT avg(age(birth_date))
    FROM employees
);