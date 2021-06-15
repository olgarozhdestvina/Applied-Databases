SELECT title, price, 
(SELECT avg(price) FROM products WHERE price > 20) "average price over 20"
FROM products WHERE price > 20;
