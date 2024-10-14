-- Task 1
-- In this first task you need to create a new procedure called AddBooking to add a new table booking record.
-- The procedure should include four input parameters in the form of the following bookings parameters: booking id, customer id, booking date, and table number.

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBooking`(IN bookingID INT, In customerID INT, IN bookingDate DATE, IN tableNumber INT)
BEGIN
	INSERT INTO Bookings (BookingID, TableNumber, BookingDate, CustomerID) VALUES (bookingID, tableNumber, bookingDate, customerID);
    SELECT 'New Booking Confirmed' AS Confirmation;
END