CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBooking`(IN bookingID INT, In customerID INT, IN bookingDate DATE, IN tableNumber INT)
BEGIN
	INSERT INTO Bookings (BookingID, TableNumber, BookingDate, CustomerID) VALUES (bookingID, tableNumber, bookingDate, customerID);
    SELECT 'New Booking Confirmed' AS Confirmation;
END