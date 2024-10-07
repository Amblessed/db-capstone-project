-- Task 2
-- For your second task, Little Lemon need you to create a new procedure called UpdateBooking that they can use to update existing bookings in the booking table.
-- The procedure should have two input parameters in the form of booking id and booking date. You must also include an UPDATE statement inside the procedure. 

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBooking`(IN bookingID INT, IN bookingDate DATE)
BEGIN
	UPDATE Bookings SET Bookings.BookingDate = bookingDate WHERE Bookings.BookingID = bookingID;
    SELECT CONCAT('Booking ', bookingID, ' updated') AS Confirmation;
END