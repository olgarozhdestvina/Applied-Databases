SELECT DISTINCT vehicle_id, "name" "owner_name", address, status, current_location
FROM suspected_rides sr

INNER JOIN "public"."rides" r ON sr.ride_id = r.id
INNER JOIN "public"."vehicles" v ON r.vehicle_id = v.id
INNER JOIN "public"."users" u ON v.owner_id = u.id;