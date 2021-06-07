SELECT
  category,
  prod_id,
  price,
  min( price ) OVER( PARTITION BY category) "cheapest_in_category"
FROM
  products;