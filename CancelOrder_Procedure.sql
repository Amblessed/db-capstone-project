-- Task 3
-- Your third and final task is to create a stored procedure called CancelOrder. Little Lemon want to use this stored procedure to delete an order record based on the user input of the order id.
-- Creating this procedure will allow Little Lemon to cancel any order by specifying the order id value in the procedure parameter without typing the entire SQL delete statement.  

CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelOrder`(IN id INT)
BEGIN
    DELETE FROM Orders WHERE OrderID = id;
    SELECT CONCAT('Order ', id, ' is cancelled') AS Confirmation;
END