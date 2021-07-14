SELECT DISTINCT vehicle_id, "name" "owner_name", address, status, current_location
FROM "public"."vehicle_location_histories" vlh

INNER JOIN "public"."rides" r ON vlh.ride_id = r.id
INNER JOIN "public"."vehicles" v ON r.vehicle_id = v.id
INNER JOIN "public"."users" u ON v.owner_id = u.id

WHERE lat BETWEEN -74.997 AND -74.9968  AND long BETWEEN 40.5 AND 40.6
AND "timestamp"::date = '2020-06-23';