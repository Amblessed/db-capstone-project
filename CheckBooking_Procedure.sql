CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckBooking`(IN bookingDate DATE, IN tableNumber INT)
BEGIN
	IF EXISTS(SELECT * FROM Bookings WHERE BookingDate = bookingDate AND TableNumber = tableNumber) THEN
    SELECT CONCAT('Table ', tableNumber, ' is already booked') AS 'Booking Status';
    END IF;
END