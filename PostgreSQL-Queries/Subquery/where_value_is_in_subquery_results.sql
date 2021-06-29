SELECT prod_id FROM products
WHERE category IN (
    SELECT category FROM categories
    WHERE categoryname IN ('Comedy', 'Family', 'Classics')
)
ORDER BY prod_id;