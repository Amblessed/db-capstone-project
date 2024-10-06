SELECT Customers.CustomerID, Customers.FullName, Orders.OrderID, Orders.TotalCost AS Cost, Menu.MenuName, MenuItems.CourseName
FROM Customers
INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
INNER JOIN Menu ON Menu.MenuID = Orders.OrderID
INNER JOIN MenuItems ON MenuItems.MenuItemsID = Menu.MenuItemsID
WHERE Orders.TotalCost > 200;


SELECT Menu.MenuName FROM Menu WHERE MenuID = ANY(SELECT Orders.OrderID FROM Orders WHERE Quantity > 2);


CALL GetMaxQuantity();


-- Task 2
-- In the second task, Little Lemon need you to help them to create a prepared statement called GetOrderDetail. 
PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, TotalCost AS Cost FROM Orders WHERE CustomerID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;


Call CancelOrder(10);
