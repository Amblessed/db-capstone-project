CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBooking`(IN bookingID INT, IN bookingDate DATE)
BEGIN
	UPDATE Bookings SET Bookings.BookingDate = bookingDate WHERE Bookings.BookingID = bookingID;
    SELECT CONCAT('Booking ', bookingID, ' updated') AS Confirmation;
END