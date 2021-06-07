SELECT emp_no, salary,
        count(salary) OVER(
            PARTITION BY emp_no
            ORDER BY salary
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        )
FROM salaries;