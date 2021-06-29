SELECT customerid, firstname, lastname, income
FROM customers c
WHERE EXISTS (
    SELECT * FROM orders o
    WHERE c.customerid = o.customerid
    AND totalamount > 400
) AND income > 90000
ORDER BY customerid;