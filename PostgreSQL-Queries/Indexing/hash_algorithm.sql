-- hash algorithm
-- can only handle equality (=)
-- 
CREATE INDEX idx_countrycode
ON city USING hash (countrycode);

-- query then is

-- explain ANALYZE
-- select "name", district, countrycode
-- from city
-- where countrycode = 'BEL' and countrycode = 'TUN' and countrycode ='NLD';