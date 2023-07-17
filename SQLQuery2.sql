--Create Database.
CREATE DATABASE SQLQueryPP

--Create Customer table with columns Customer Id, Customer Name, Phone, Address.
CREATE TABLE Customer (
    CustomerId INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName VARCHAR(50),
    Phone VARCHAR(20),
    Address VARCHAR(100)
);

--Add few customer details into customer table.
INSERT INTO Customer (CustomerName, Phone, Address)
VALUES
    ('John Doe', '123-456-7890', '123 Main St'),
    ('Jane Smith', '987-654-3210', '456 Elm St'),
    ('Bob Johnson', '555-555-5555', '789 Oak Ave');
--Add new columns like Country, Salary and Pincode and update values.
ALTER TABLE Customer
ADD Country VARCHAR(50),
    Salary DECIMAL(10, 2),
    Pincode VARCHAR(10);
--Update customer details based on customer name.
UPDATE Customer
SET Country = 'United States', Salary = 50000.00, Pincode = '12345'
WHERE CustomerId = 1;

UPDATE Customer
SET Country = 'Canada', Salary = 60000.00, Pincode = 'M5V 1A1'
WHERE CustomerId = 2;

-- Update more records as neededUPDATE Customer
UPDATE Customer
SET Country = 'India',
    Salary = 75000.00,
    Pincode = '54321'
WHERE CustomerName = 'John Doe';

--Show number of customers in each country.
SELECT Country, COUNT(*) AS NumberOfCustomers
FROM Customer
GROUP BY Country;

--Show maximum salary, minimum salary, total Salary and average salary for the customers.
SELECT MAX(Salary) AS MaximumSalary,
       MIN(Salary) AS MinimumSalary,
       SUM(Salary) AS TotalSalary,
       AVG(Salary) AS AverageSalary
FROM Customer;

--Create order table with columns order id, product name, quantity and rating.
CREATE TABLE [Order] (
    OrderID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Quantity INT,
    Rating INT
);


INSERT INTO [Order] (OrderID, ProductName, Quantity, Rating)
VALUES
    (1, 'Product A', 5, 4),
    (2, 'Product B', 3, 5),
    (3, 'Product C', 2, 3);


--Fetch data from both tables.
SELECT c.CustomerName, o.OrderID, o.ProductName, o.Quantity, o.Rating
FROM Customer c
JOIN [Order] o ON c.CustomerID = o.OrderID;






