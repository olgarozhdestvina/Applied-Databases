SELECT orderid, customerid, tax, totalamount
FROM orders
WHERE CASE
    WHEN customerid > 10 THEN netamount < 100
    ELSE netamount > 100
END
ORDER BY customerid;