SELECT category, prod_id, price,
last_value(price) OVER (PARTITION BY category ORDER BY price RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) "highest_in_category"
FROM products;