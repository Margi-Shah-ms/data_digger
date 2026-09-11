CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
Name VARCHAR(100),
Email VARCHAR(100),
Address VARCHAR(255));

INSERT INTO Customers (CustomerID,Name, Email, Address) VALUES
(1,'Alice', 'alice@example.com', '123 Main St'),
(2,'Bob', 'bob@example.com', '456 Oak St'),
(3,'Charlie', 'charlie@example.com', '789 Pine St'),
(4,'Eve', 'ave.smith@example.com', '101 Maple St'),
(5,'David', 'david@example.com', '202 Birch St');

SELECT * FROM Customers;

UPDATE Customers 
SET Address = '999 New Ville St' 
WHERE CustomerID = 2;

DELETE FROM Customers 
WHERE CustomerID = 5;

SELECT * FROM Customers 
WHERE Name = 'Alice';

CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
TotalAmount DECIMAL(10, 2),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));

INSERT INTO Orders (OrderID,CustomerID, OrderDate, TotalAmount) VALUES
(1,1, '2023-10-01', 1200.00),
(2,1, '2023-10-15', 800.00),
(3,3, '2023-11-05', 1500.00),
(4,4, '2023-11-10', 600.00),
(5,1, '2023-11-12', 2500.00);

SELECT * FROM Orders;

UPDATE Orders 
SET TotalAmount = 1300.00 
WHERE OrderID = 1;

DELETE FROM Orders 
WHERE OrderID = 3;

SELECT * FROM Orders 
WHERE OrderDate >= '2026-08-11';

SELECT 
  MAX(TotalAmount) AS highestamount,
    MIN(TotalAmount) AS lowestamount,
    AVG(TotalAmount) AS averageamount
FROM Orders;

CREATE TABLE Products (ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
Price DECIMAL(10, 2),
Stock INT);

INSERT INTO Products (ProductID,ProductName, Price, Stock) VALUES
(1, 'Laptop', 55000.00, 10),
(2, 'Wireless Mouse', 600.00, 50),
(3, 'Keyboard', 1200.00, 0),
(4, 'Headphones', 1800.00, 25),
(5, 'USB Cable', 300.00, 100);

SELECT * FROM Products; 
ORDER BY Price DESC;

UPDATE Products 
SET Price = 650.00 
WHERE ProductID = 2;

DELETE FROM Products 
WHERE Stock = 0;

SELECT * FROM Products 
WHERE Price BETWEEN 500 AND 2000;

SELECT MAX(Price) AS expensive, MIN(Price) AS cheapest 
FROM Products;

CREATE TABLE OrderDetails (
OrderDetailID INT PRIMARY KEY,
OrderID INT,
ProductID INT,
Quantity INT,
SubTotal DECIMAL(10, 2),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID));

INSERT INTO OrderDetails (OrderDetailID,OrderID, ProductID, Quantity, SubTotal) VALUES
(1, 1, 1, 1, 55000.00),
(2, 1, 2, 2, 1300.00),
(3, 2, 4, 1, 1800.00),
(4, 4, 2, 3, 1950.00),
(5, 4, 5, 2, 600.00);

select * from OrderDetails;
SELECT * FROM OrderDetails where OrderID = 1;

SELECT SUM(SubTotal) AS totalrevenue 
FROM OrderDetails;

SELECT ProductID, SUM(Quantity) AS totalordered
FROM OrderDetails
GROUP BY ProductID
ORDER BY Totalordered DESC
LIMIT 3;

SELECT COUNT(*) AS countsale 
FROM OrderDetails 
WHERE ProductID = 2;