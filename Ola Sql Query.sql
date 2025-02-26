select  * from bookings;

-- 1. Retrieve all successfull bookings:
create view Succesfull_Bookings as 
select * from bookings 
where Booking_Status = 'Success';
--
select * from Succesfull_Bookings;

-- 2. find the average ride distance for each vehicle for each vehicle type:
create view ride_distance_for_each_vehicle As
select vehicle_type, avg(ride_distance)
as avg_distance from bookings 
group by vehicle_type;

-- 
select * from ride_distance_for_each_vehicle;

-- 3. Get the total number of canceled rides by customer:
Create view canceled_rides_by_customers as
select count(*) from bookings
where booking_status = 'Canceled by Customer';
--
select * from canceled_rides_by_customers;

-- 4. List the top 5 customer who booked the highest number of rides:
Create view top_5_customers as 
select customer_id, Count(Booking_id) as total_rides
from bookings
group by customer_id
order by total_rides desc limit 5;
--
select * from top_5_customers;

-- 5. Get the number of rides canceled by driver due to personal and car-related issue:
create view Rides_canceled_by_driver_P_C_Issue as
select count(*) from bookings
where  canceled_rides_by_driver = 'Personal & Car related issue';
--
select * from Rides_canceled_by_driver_P_C_Issue;

-- 6. Find the maximum and minimum driver rating for prime sedan booking:
Create view max_min_driver_rating as
select max(driver_ratings) as max_rating,
Min(driver_ratings) as min_rating
from bookings where vehicle_type = 'Prime Sedan';
--
select * from max_min_driver_rating;

-- 7. Retrieve all rides where payment method was made using UPI:
create view UPI_payment as
select * from bookings
where payment_method = 'UPI';
--
select * from UPI_payment;

-- 8. Find the average customer rating per vehicle type:
create view avg_customer_rating as
SELECT vehicle_type, 
       AVG(CAST(NULLIF(customer_rating, 'null') AS FLOAT)) AS avg_customer_rating
FROM bookings
GROUP BY vehicle_type;
--
select * from avg_customer_rating;

-- 9. Calculate the total booking value of rides  completed succesfully:
create view total_succesfull_ride_value as
select sum(booking_value) as total_succesfull_ride_value
from bookings
where booking_status = 'Success';
--
select * from total_succesfull_ride_value;

-- 10. List all incomplete rides along with reason:
create view incomplete_rides_reason as
Select booking_id, incomplete_rides_reason
from bookings
where incomplete_rides = 'Yes';
--
select * from incomplete_rides_reason;