SELECT DISTINCT vehicle_id, "name" "rider_name", address
FROM suspected_rides sr

INNER JOIN "public"."rides" r ON sr.ride_id = r.id
INNER JOIN "public"."users" u ON r.rider_id = u.id;