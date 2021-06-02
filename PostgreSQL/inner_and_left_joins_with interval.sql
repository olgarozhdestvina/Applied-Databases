SELECT e.emp_no, salary, COALESCE(title, ' No Title Change') FROM employees AS e
INNER JOIN "public"."salaries" AS s
ON s.emp_no = e.emp_no
LEFT JOIN "public"."titles" AS t
ON t.emp_no = e.emp_no
AND (t.from_date = s.from_date 
OR t.from_date = s.from_date + INTERVAL '2 days')
ORDER BY emp_no;