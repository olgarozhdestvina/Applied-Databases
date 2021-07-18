SELECT DISTINCT
    concat(t1.first_name, ' ', t1.last_name) "employee",
    concat(u.first_name, ' ', u.last_name) "rider"

FROM dblink('host=localhost user=postgres password=postgres dbname=movr_employees', 'SELECT first_name, last_name FROM employees;')

AS t1("first_name" NAME, "last_name" NAME)

JOIN suspected_rider_names u ON t1.last_name = u.last_name
ORDER BY rider; 