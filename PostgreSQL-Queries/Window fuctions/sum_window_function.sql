SELECT customerid, orderid, netamount,
sum(netamount) OVER ( PARTITION BY customerid
ORDER BY orderid) "cumsum"
FROM orders;