SELECT orderlineid, prod_id, quantity
FROM orderlines
JOIN (
    SELECT prod_id
    FROM products
    WHERE category IN (
        SELECT category FROM categories
        WHERE categoryname IN ('Comedy', 'Family', 'Classics')
    )
) limited USING(prod_id)
ORDER BY orderlineid;