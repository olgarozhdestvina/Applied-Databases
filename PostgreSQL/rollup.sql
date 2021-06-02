SELECT  EXTRACT(YEAR FROM orderdate) "year",
        EXTRACT(MONTH FROM orderdate) "month",
        EXTRACT(DAY FROM orderdate) "day",
        sum(quantity)
FROM orderlines
GROUP BY 
    ROLLUP (
        (YEAR, MONTH, DAY)
    )
ORDER BY YEAR, MONTH, DAY