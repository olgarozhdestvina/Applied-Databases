SELECT prod_id, title, sales
FROM products
JOIN inventory USING (prod_id)
WHERE sales > ALL (
    SELECT avg(sales) FROM inventory
    JOIN products USING(prod_id)
    GROUP BY category
);