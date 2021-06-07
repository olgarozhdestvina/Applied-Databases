SELECT category, prod_id, price
max(price) OVER (PARTITION BY category) "highest_in_category"
FROM products;