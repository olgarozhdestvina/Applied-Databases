SELECT orderid, tax, customerid,
CASE
    WHEN customerid=2 THEN 'first customer'
    ELSE 'not first customer'
END "type",
totalamount
FROM orders
ORDER BY customerid;