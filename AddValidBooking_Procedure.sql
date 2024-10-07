-- Task 3
-- For your third and final task, Little Lemon need to verify a booking, and decline any reservations for tables that are already booked under another name. 
-- Since integrity is not optional, Little Lemon need to ensure that every booking attempt includes these verification and decline steps. However, implementing these steps requires a stored procedure and a transaction. 
-- To implement these steps, you need to create a new procedure called AddValidBooking. This procedure must use a transaction statement to perform a rollback if a customer reserves a table that’s already booked under another name.  


CREATE DEFINER=`root`@`localhost` PROCEDURE `AddValidBooking`(IN bookingDate DATE, IN tableNumber INT)
BEGIN
START TRANSACTION; 
	INSERT INTO Bookings(TableNumber, BookingDate) VALUES(tableNumber, bookingDate);
    IF EXISTS(SELECT * FROM Bookings WHERE BookingDate = bookingDate AND TableNumber = tableNumber) THEN
		SELECT CONCAT('Table ', tableNumber, ' is already booked - booking cancelled') AS 'Booking Status';
		ROLLBACK;
    ELSE 
		COMMIT;
    END IF;
    
END