SELECT orderid, customerid, 
sum( CASE
        WHEN totalamount < 100 THEN -100
        ELSE totalamount
     END ) AS "refund",
sum (totalamount) AS "normal total"
FROM orders
GROUP BY orderid
ORDER BY customerid;