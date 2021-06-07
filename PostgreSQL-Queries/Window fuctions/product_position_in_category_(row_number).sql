SELECT category, prod_id, price,
row_number() OVER (
PARTITION BY category ORDER BY price) "position_in_category_by_price"
FROM products;