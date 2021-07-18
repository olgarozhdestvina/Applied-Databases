CREATE VIEW suspected_rider_names AS
SELECT DISTINCT 
    split_part( "name", ' ', 1) "first_name",
    split_part( "name", ' ', 2) "last_name"
FROM suspected_rides sr
JOIN rides r ON r.id = sr.ride_id
JOIN users u ON u.id = r.rider_id;