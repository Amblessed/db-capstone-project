-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8mb3 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `FullName` VARCHAR(45) NOT NULL,
  `ContactNumber` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `StaffID` INT NOT NULL,
  `Name` VARCHAR(75) NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(255) NOT NULL,
  `ContactNumber` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `AnnualSalary` DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `TableNumber` INT NOT NULL,
  `BookingDate` DATE NOT NULL,
  `CustomerID` INT NULL DEFAULT NULL,
  `StaffID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `booking_customer_fk_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `booking_staff_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `booking_customer_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`),
  CONSTRAINT `booking_staff`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemonDB`.`Staff` (`StaffID`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItems` (
  `MenuItemsID` INT NOT NULL AUTO_INCREMENT,
  `CourseName` VARCHAR(45) NOT NULL,
  `StarterName` VARCHAR(45) NOT NULL,
  `DessertName` VARCHAR(45) NOT NULL,
  `DrinkName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuItemsID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `MenuID` INT NOT NULL AUTO_INCREMENT,
  `MenuItemsID` INT NOT NULL,
  `MenuName` VARCHAR(45) NOT NULL,
  `Cuisine` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `menu_item_fk_idx` (`MenuItemsID` ASC) VISIBLE,
  CONSTRAINT `menu_item_fk`
    FOREIGN KEY (`MenuItemsID`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`MenuItemsID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `MenuID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `TotalCost` DECIMAL(10,0) NOT NULL,
  `Quantity` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `order_menu_id_idx` (`MenuID` ASC) VISIBLE,
  INDEX `order_customer_fk_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `order_customer_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`),
  CONSTRAINT `order_menu_fk`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB`.`Menu` (`MenuID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`OrderDelivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`OrderDelivery` (
  `OrderDeliveryID` INT NOT NULL,
  `DeliveryDate` DATE NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `OrderID` INT NOT NULL,
  PRIMARY KEY (`OrderDeliveryID`),
  INDEX `order_delivery_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `order_delivery`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDB`.`Orders` (`OrderID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Placeholder table for view `LittleLemonDB`.`OrdersView`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`OrdersView` (`OrderID` INT, `Quantity` INT, `Cost` INT);

-- -----------------------------------------------------
-- procedure AddBooking
-- -----------------------------------------------------

DELIMITER $$
USE `LittleLemonDB`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBooking`(IN bookingID INT, In customerID INT, IN bookingDate DATE, IN tableNumber INT)
BEGIN
	INSERT INTO Bookings (BookingID, TableNumber, BookingDate, CustomerID) VALUES (bookingID, tableNumber, bookingDate, customerID);
    SELECT 'New Booking Confirmed' AS Confirmation;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure AddValidBooking
-- -----------------------------------------------------

DELIMITER $$
USE `LittleLemonDB`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddValidBooking`(IN bookingDate DATE, IN tableNumber INT)
BEGIN
START TRANSACTION; 
	INSERT INTO Bookings(TableNumber, BookingDate) VALUES(tableNumber, bookingDate);
    IF EXISTS(SELECT * FROM Bookings WHERE BookingDate = bookingDate AND TableNumber = tableNumber) THEN
		SELECT CONCAT('Table ', tableNumber, ' is already booked - booking cancelled') AS 'Booking Status';
		ROLLBACK;
    ELSE 
		COMMIT;
    END IF;
    
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure CancelBooking
-- -----------------------------------------------------

DELIMITER $$
USE `LittleLemonDB`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelBooking`(IN bookingID INT)
BEGIN
	DELETE FROM Bookings WHERE Bookings.BookingID = bookingID;
    SELECT CONCAT('Booking ', bookingID, ' cancelled') AS Confirmation;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure CancelOrder
-- -----------------------------------------------------

DELIMITER $$
USE `LittleLemonDB`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelOrder`(IN id INT)
BEGIN
    DELETE FROM Orders WHERE OrderID = id;
    SELECT CONCAT('Order ', id, ' is cancelled') AS Confirmation;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure CheckBooking
-- -----------------------------------------------------

DELIMITER $$
USE `LittleLemonDB`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckBooking`(IN bookingDate DATE, IN tableNumber INT)
BEGIN
	IF EXISTS(SELECT * FROM Bookings WHERE BookingDate = bookingDate AND TableNumber = tableNumber) THEN
    SELECT CONCAT('Table ', tableNumber, ' is already booked') AS 'Booking Status';
    END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure GetMaxQuantity
-- -----------------------------------------------------

DELIMITER $$
USE `LittleLemonDB`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMaxQuantity`()
BEGIN
	SELECT MAX(Quantity) AS 'Max Quantity in Order' FROM Orders;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure UpdateBooking
-- -----------------------------------------------------

DELIMITER $$
USE `LittleLemonDB`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBooking`(IN bookingID INT, IN bookingDate DATE)
BEGIN
	UPDATE Bookings SET Bookings.BookingDate = bookingDate WHERE Bookings.BookingID = bookingID;
    SELECT CONCAT('Booking ', bookingID, ' updated') AS Confirmation;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure new_procedure
-- -----------------------------------------------------

DELIMITER $$
USE `LittleLemonDB`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_procedure`(IN bookingID INT, IN bookingDate DATE)
BEGIN
	UPDATE Bookings SET BookingDate = bookingDate WHERE BookingID = bookingID;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `LittleLemonDB`.`OrdersView`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`OrdersView`;
USE `LittleLemonDB`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `LittleLemonDB`.`OrdersView` AS select `LittleLemonDB`.`Orders`.`OrderID` AS `OrderID`,`LittleLemonDB`.`Orders`.`Quantity` AS `Quantity`,`LittleLemonDB`.`Orders`.`TotalCost` AS `Cost` from `LittleLemonDB`.`Orders` where (`LittleLemonDB`.`Orders`.`Quantity` > 2);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
