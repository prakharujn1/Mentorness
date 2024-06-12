CREATE DATABASE hotel_reservation_db;
USE hotel_reservation_db;
SELECT * FROM hotel_reservation;
 
-- Q1. What is the total number of reservations in the dataset?
SELECT COUNT(*) FROM hotel_reservation;

-- Q2. Which meal plan is the most popular among guests?
SELECT type_of_meal_plan,COUNT(*) FROM hotel_reservation GROUP BY type_of_meal_plan ORDER BY COUNT(*) DESC LIMIT 1;

-- Q3. What is the average price per room for reservations involving children?
SELECT AVG(avg_price_per_room) FROM hotel_reservation WHERE no_of_children>0;

-- Q4. How many reservations were made for the year 20XX (replace XX with the desired year)?
 SELECT COUNT(*) FROM hotel_reservation WHERE YEAR(arrival_date) LIKE "20%";
 
-- Q5. What is the most commonly booked room type?
SELECT room_type_reserved,COUNT(*) FROM hotel_reservation GROUP BY room_type_reserved ORDER BY COUNT(*) DESC LIMIT 1;

-- Q6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
SELECT COUNT(*) FROM hotel_reservation WHERE no_of_weekend_nights > 0;

-- Q7. What is the highest and lowest lead time for reservations?
SELECT MAX(lead_time),MIN(lead_time) FROM hotel_reservation ;

-- Q8. What is the most common market segment type for reservations?
SELECT market_segment_type,COUNT(*) FROM hotel_reservation GROUP BY market_segment_type ORDER BY COUNT(*) DESC LIMIT 1;

-- Q9. How many reservations have a booking status of "Confirmed"?
SELECT COUNT(*) FROM hotel_reservation WHERE booking_status LIKE 'Not_Canceled';

-- Q10. What is the total number of adults and children across all reservations?
SELECT SUM(no_of_adults),SUM(no_of_children) FROM hotel_reservation;

-- Q11. What is the average number of weekend nights for reservations involving children?
SELECT AVG(no_of_weekend_nights) FROM hotel_reservation WHERE no_of_children>0;

-- Q12. How many reservations were made in each month of the year?
SELECT MONTH(arrival_date) AS MONTH ,COUNT(*) FROM hotel_reservation GROUP BY MONTH;

-- Q13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
SELECT (AVG(no_of_week_nights+no_of_weekend_nights)),room_type_reserved FROM hotel_reservation GROUP BY room_type_reserved;

-- Q14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
SELECT room_type_reserved,COUNT(*),AVG(avg_price_per_room) FROM hotel_reservation WHERE no_of_children>0 GROUP BY room_type_reserved ORDER BY COUNT(*) DESC LIMIT 1;

-- Q15. Find the market segment type that generates the highest average price per room.
SELECT market_segment_type,AVG(avg_price_per_room) FROM hotel_reservation GROUP BY market_segment_type ORDER BY AVG(avg_price_per_room) DESC LIMIT 1;


