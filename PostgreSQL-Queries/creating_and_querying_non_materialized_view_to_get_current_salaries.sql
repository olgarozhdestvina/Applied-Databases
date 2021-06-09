-- create or replace view last_salary_change AS
-- select emp_no, MAX(s.from_date)
-- from salaries s
-- 
-- join employees using(emp_no)
-- join dept_emp using(emp_no)
-- join departments using(dept_no)
-- 
-- group by emp_no
-- order by emp_no;

SELECT emp_no, concat(first_name, ' ', last_name) "full_name",
dept_name, salary, s.from_date
FROM salaries s

JOIN last_salary_change USING(emp_no)
JOIN employees USING(emp_no)
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)

WHERE s.from_date = max
ORDER BY emp_no;