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