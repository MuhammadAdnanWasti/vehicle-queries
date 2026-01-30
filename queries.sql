--query 1

SELECT 
    b.booking_id,
    u.name AS customer_name,
    v.name AS vehicle_name,
    b.start_date,
    b.end_date,
    b.status
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Vehicles v ON b.vehicle_id = v.vehicle_id
ORDER BY b.booking_id;

--query 2

SELECT 
    v.*
FROM Vehicles v
WHERE NOT EXISTS (
    SELECT 1 
    FROM Bookings b 
    WHERE b.vehicle_id = v.vehicle_id
)
ORDER BY v.vehicle_id;

--query 3
SELECT *
FROM Vehicles
WHERE type = 'car' AND status = 'available'
ORDER BY vehicle_id;

--query 4
SELECT 
    v.name AS vehicle_name,
    COUNT(b.booking_id) AS total_bookings
FROM Vehicles v
JOIN Bookings b ON v.vehicle_id = b.vehicle_id
GROUP BY  v.name
HAVING COUNT(b.booking_id) > 2
