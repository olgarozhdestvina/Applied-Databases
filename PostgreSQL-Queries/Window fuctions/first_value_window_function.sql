SELECT
  category,
  prod_id,
  price,
  first_value( price ) OVER( PARTITION BY category ORDER BY price RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) "cheapest_in_category"
FROM
  products;