CREATE TABLE `productlines` (
  `productLine` int PRIMARY KEY,
  `textDecription` text,
  `htmlDescription` text,
  `image` varchar(255)
);

CREATE TABLE `products` (
  `productCode` int PRIMARY KEY,
  `productName` varchar(255),
  `productline` varchar(255),
  `productScale` varchar(255),
  `productVendor` varchar(255),
  `productDescription` text,
  `quantityInstock` varchar(255),
  `buyPrice` varchar(255),
  `MSRP` varchar(255)
);

CREATE TABLE `orderdetails` (
  `orderNumber` int,
  `productCode` int,
  `quantityOrdered` int,
  `priceEach` int,
  `orderLineNumber` int,
  PRIMARY KEY (`orderNumber`, `productCode`)
);

CREATE TABLE `orders` (
  `orderNumber` int PRIMARY KEY,
  `orderDate` date,
  `requiredDate` varchar(255),
  `shippedDate` date,
  `status` varchar(255),
  `comments` varchar(255),
  `customerNumber` int
);

CREATE TABLE `payments` (
  `customerNumber` int,
  `chechkNumber` int,
  `paymentDate` date,
  `amount` varchar(255),
  PRIMARY KEY (`customerNumber`, `chechkNumber`)
);

CREATE TABLE `customers` (
  `customerNumber` int PRIMARY KEY,
  `customerName` varchar(255),
  `contactLastName` varchar(255),
  `contactFirstName` varchar(255),
  `phone` varchar(255),
  `addressLine1` varchar(255),
  `addressLine2` varchar(255),
  `city` varchar(255),
  `state` varchar(255),
  `postalCode` int,
  `country` varchar(255),
  `salesRepEmployeeNumber` varchar(255),
  `creditLimit` varchar(255)
);

CREATE TABLE `employees` (
  `employeeNumber` int PRIMARY KEY,
  `lastName` varchar(255),
  `firstName` varchar(255),
  `extension` varchar(255),
  `email` varchar(255),
  `officeCode` int,
  `reporstTo` varchar(255),
  `jobTitle` varchar(255)
);

CREATE TABLE `offices` (
  `officeCode` int PRIMARY KEY,
  `city` varchar(255),
  `phone` varchar(255),
  `addressLine1` varchar(255),
  `addressLine2` varchar(255),
  `state` varchar(255),
  `county` varchar(255),
  `postalCode` int,
  `territory` varchar(255)
);

ALTER TABLE `products` ADD FOREIGN KEY (`productline`) REFERENCES `productlines` (`htmlDescription`);

ALTER TABLE `orderdetails` ADD FOREIGN KEY (`quantityOrdered`) REFERENCES `products` (`productline`);

ALTER TABLE `orders` ADD FOREIGN KEY (`orderNumber`) REFERENCES `orderdetails` (`orderLineNumber`);

ALTER TABLE `orders` ADD FOREIGN KEY (`status`) REFERENCES `customers` (`customerName`);

ALTER TABLE `customers` ADD FOREIGN KEY (`postalCode`) REFERENCES `payments` (`customerNumber`);

ALTER TABLE `customers` ADD FOREIGN KEY (`customerName`) REFERENCES `employees` (`jobTitle`);

ALTER TABLE `employees` ADD FOREIGN KEY (`employeeNumber`) REFERENCES `employees` (`reporstTo`);

ALTER TABLE `employees` ADD FOREIGN KEY (`firstName`) REFERENCES `offices` (`addressLine2`);
