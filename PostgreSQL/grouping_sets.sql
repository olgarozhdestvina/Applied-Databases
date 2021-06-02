SELECT prod_id, orderlineid, sum(quantity)
FROM orderlines
GROUP BY
    GROUPING SETS(
        (),
        (prod_id),
        (orderlineid)
    )
ORDER BY prod_id DESC, orderlineid DESC