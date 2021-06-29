SELECT concat(firstname, ' ', lastname) "fullname", orderid
FROM orders o,
(SELECT customerid, state, firstname, lastname
FROM customers) c
WHERE o.customerid = c.customerid AND 
state IN ('OH', 'NY', 'OR')
ORDER BY orderid;