SELECT *
FROM dblink('host=localhost user=postgres password=yourpassword dbname=Employees', 'SELECT first_name, last_name FROM employees;') AS t1("full name" NAME, "last name" NAME)
