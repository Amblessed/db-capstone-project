CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelBooking`(IN bookingID INT)
BEGIN
	DELETE FROM Bookings WHERE Bookings.BookingID = bookingID;
    SELECT CONCAT('Booking ', bookingID, ' cancelled');
END