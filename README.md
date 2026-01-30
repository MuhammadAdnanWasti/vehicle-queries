ERD: https://drawsql.app/teams/mohammad-adnan/diagrams/vehicle-rent


📌 Query 1 — Booking Details with Customer & Vehicle Info

This query retrieves complete booking information along with customer name and vehicle name by joining Bookings, Users, and Vehicles tables.

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


✅ Shows:

Booking ID

Customer name

Vehicle name

Start & end date

Booking status

📌 Query 2 — Vehicles With No Bookings

This query returns all vehicles that have never been booked using a NOT EXISTS subquery.

SELECT 
    v.*
FROM Vehicles v
WHERE NOT EXISTS (
    SELECT 1 
    FROM Bookings b 
    WHERE b.vehicle_id = v.vehicle_id
)
ORDER BY v.vehicle_id;


✅ Useful for:

Finding unused vehicles

Inventory optimization

Marketing availability

📌 Query 3 — Available Cars Only

This query filters vehicles to show only those that are:

Type = car

Status = available

SELECT *
FROM Vehicles
WHERE type = 'car' AND status = 'available'
ORDER BY vehicle_id;


✅ Useful for:

Customer search filters

Frontend listing APIs

Availability checks

📌 Query 4 — Vehicles With More Than 2 Bookings

This query counts bookings per vehicle and returns only those vehicles that have been booked more than 2 times.

SELECT 
    v.name AS vehicle_name,
    COUNT(b.booking_id) AS total_bookings
FROM Vehicles v
JOIN Bookings b ON v.vehicle_id = b.vehicle_id
GROUP BY v.name
HAVING COUNT(b.booking_id) > 2;


✅ Useful for:

Popular vehicle analysis

Demand tracking

Business insights

🛠 Requirements

SQL Database (PostgreSQL)

Tables:

Users

Vehicles

Bookings

Proper foreign key relationships between tables
