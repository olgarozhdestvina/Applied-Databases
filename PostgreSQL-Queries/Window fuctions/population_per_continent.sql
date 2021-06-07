SELECT DISTINCT continent, 
sum(population) OVER(
PARTITION BY continent) "population"
 FROM country
 ORDER BY continent;