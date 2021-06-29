SELECT emp_no,
       salary "most recent salary",
       from_date
FROM salaries s
JOIN (
    SELECT emp_no, max(from_date) "max"
    FROM salaries sl
    GROUP BY emp_no
) ls USING(emp_no)
WHERE ls.max =  from_date
ORDER BY emp_no;