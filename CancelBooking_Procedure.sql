-- Task 3
-- For the third and final task, Little Lemon need you to create a new procedure called CancelBooking that they can use to cancel or remove a booking.
-- The procedure should have one input parameter in the form of booking id. You must also write a DELETE statement inside the procedure. 

CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelBooking`(IN bookingID INT)
BEGIN
	DELETE FROM Bookings WHERE Bookings.BookingID = bookingID;
    SELECT CONCAT('Booking ', bookingID, ' cancelled') AS Confirmation;
END