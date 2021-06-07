SELECT DISTINCT continent, 
sum(population) OVER(
PARTITION BY continent) "population",
concat(round
        (sum(population::FLOAT) OVER(PARTITION BY continent) / 
        sum(population::FLOAT) OVER() * 100),
        '%') "percentage",
sum(population) OVER() "total"
 FROM country
 ORDER BY continent;