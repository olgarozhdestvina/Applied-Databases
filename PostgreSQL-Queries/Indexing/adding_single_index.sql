-- default b-tree
-- the best used for comparisons with <, =, >, 
-- between, in, is null is not null

CREATE INDEX idx_countrycode
ON city (countrycode);