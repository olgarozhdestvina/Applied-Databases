CREATE INDEX idx_countrycode
ON city (countrycode)
WHERE countrycode IN ('TUN','BE', 'NL');