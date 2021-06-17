-- bad use of subquery

-- select  emp_no, 
--         salary,
--         from_date, 
--         (select title
--         from titles t
--         where t.emp_no = s.emp_no and t.from_date = s.from_date)
-- from salaries s
-- order by emp_no;
 
-- join is faster
SELECT emp_no,
        salary, 
        from_date,
        title
FROM salaries
JOIN titles USING (emp_no, from_date) -- without null values
ORDER BY emp_no;