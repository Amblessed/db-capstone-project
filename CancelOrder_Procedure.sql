CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelOrder`(IN id INT)
BEGIN
    DELETE FROM Orders WHERE OrderID = id;
    SELECT CONCAT('Order ', id, ' is cancelled') AS Confirmation;
END