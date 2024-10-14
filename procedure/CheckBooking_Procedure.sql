-- Task 2
-- For your second task, Little Lemon need you to create a stored procedure called CheckBooking to check whether a table in the restaurant is already booked. Creating this procedure helps to minimize the effort involved in repeatedly coding the same SQL statements.
-- The procedure should have two input parameters in the form of booking date and table number. You can also create a variable in the procedure to check the status of each table.

CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckBooking`(IN bookingDate DATE, IN tableNumber INT)
BEGIN
	IF EXISTS(SELECT * FROM Bookings WHERE BookingDate = bookingDate AND TableNumber = tableNumber) THEN
    SELECT CONCAT('Table ', tableNumber, ' is already booked') AS 'Booking Status';
    END IF;
END