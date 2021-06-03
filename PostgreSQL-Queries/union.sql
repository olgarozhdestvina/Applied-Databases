SELECT NULL "prod_id", sum(quantity)
FROM orderlines

UNION

SELECT prod_id, sum(quantity)
FROM orderlines
GROUP BY prod_id
ORDER BY prod_id DESC