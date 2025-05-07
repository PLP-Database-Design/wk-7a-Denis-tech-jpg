--Question 1
SELECT OrderID, CustomerName, LTRIM(RTRIM(value)) AS Product
FROM ProductDetail
CROSS APPLY STRING_SPLIT(Products, ',');

--Question 2

--i Create Customers Table
CREATE TABLE Customers (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

--ii Insert Distinct Customer Data
INSERT INTO Customers (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

--iii Create OrderDetails_2NF Table (without CustomerName)
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Customers(OrderID)
);

--iv Insert Data into OrderDetails_2NF
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;
