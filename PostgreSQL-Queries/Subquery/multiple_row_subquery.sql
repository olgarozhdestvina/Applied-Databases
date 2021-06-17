SELECT title, price, category
FROM products
WHERE category IN (
 SELECT category FROM categories
 WHERE categoryname IN ('Comedy', 'Family', ' Classics')
 );