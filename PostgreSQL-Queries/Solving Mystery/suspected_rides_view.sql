CREATE VIEW suspected_rides AS 
SELECT * FROM "public"."vehicle_location_histories"
WHERE lat BETWEEN -74.997 AND -74.9968  AND long BETWEEN 40.5 AND 40.6
AND "timestamp"::date = '2020-06-23';