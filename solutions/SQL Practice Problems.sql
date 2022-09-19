/* Introductory Problems */

--Exercise 1
SELECT * FROM Shippers

--Exercise 2
SELECT CategoryName,Description
FROM Categories

--Exercise 3
SELECT FirstName,LastName,HireDate 
FROM Employees
WHERE Title = 'Sales Representative'

--Exercise 4
SELECT FirstName, LastName, HireDate 
FROM Employees
WHERE Title = 'Sales Representative'
AND Country = 'USA'

--Exercise 5
SELECT OrderID, OrderDate
FROM Orders
WHERE EmployeeID = 5

--Exercise 6
SELECT SupplierID, ContactName, ContactTitle
FROM Suppliers
WHERE ContactTitle  != 'Marketing Manager'
--OR
SELECT SupplierID, ContactName, ContactTitle
FROM Suppliers
WHERE ContactTitle  <> 'Marketing Manager'

--Exercise 7
SELECT ProductID, ProductName 
FROM Products
WHERE ProductName LIKE '%queso%'

--Exercise 8
SELECT OrderID, CustomerID, ShipCountry 
FROM Orders
WHERE ShipCountry = 'France' 
	OR ShipCountry ='Belgium'

--Exercise 9
SELECT OrderID, CustomerID, ShipCountry 
FROM Orders
WHERE ShipCountry IN('Brazil','Mexico','Argentina','Venezuela')

--Exercise 10
SELECT FirstName, LastName, Title, BirthDate
FROM Employees
ORDER BY BirthDate

--Exercise 11
SELECT FirstName, LastName, Title, CONVERT(DATE,BirthDate) AS DateOnlyBirthDate
FROM Employees
ORDER BY BirthDate


--Exercise 12
SELECT FirstName, LastName,CONCAT(FirstName,' ',LastName) AS FullName
FROM Employees

--Exercise 13
SELECT OrderID, ProductID, UnitPrice, Quantity, UnitPrice * Quantity as TotalPrice
FROM [Order Details]

--Exercise 14
SELECT COUNT(*) AS TotalCustomers 
FROM Customers

--Exercise 15
SELECT MIN(OrderDate) as FirstOrder
FROM Orders
-- 
SELECT TOP (1) OrderDate
FROM Orders
ORDER BY OrderDate

--Exercise 16
SELECT Country
FROM Customers
GROUP BY Country

--Exercise 17
SELECT ContactTitle, COUNT(ContactTitle) AS TotalContactTitle
FROM Customers
GROUP BY ContactTitle
ORDER BY TotalContactTitle DESC

--Exercise 18
SELECT ProductID, ProductName, Suppliers.CompanyName
FROM Products
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID

--Exercise 19
SELECT OrderID,CONVERT(DATE,OrderDate) AS OrderDate, Shippers.CompanyName
FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE OrderID < 10300


/* Intermediate Problems */


--Exercise 20
SELECT CategoryName, COUNT(Products.ProductID) as TotalProducts
FROM Categories
INNER JOIN Products ON Products.CategoryID = Categories.CategoryID
GROUP BY CategoryName
ORDER BY TotalProducts DESC

--Exercise 21
SELECT Country, City, COUNT(CustomerID) AS TotalCustomer
FROM Customers
GROUP BY Country, City
ORDER BY TotalCustomer DESC

--Exercise 22
SELECT ProductID, ProductName, UnitsInStock, ReorderLevel 
FROM Products
WHERE UnitsInStock <= ReorderLevel
ORDER BY ProductID

--Exercise 23
SELECT ProductID, ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued 
FROM Products
WHERE (UnitsInStock + UnitsOnOrder) <= ReorderLevel 
	AND Discontinued = 0
ORDER BY ProductID

--Exercise 24
SELECT CustomerID, CompanyName, Region 
FROM Customers
ORDER BY 
CASE
	WHEN Region is null THEN 1
	ELSE 0
END
,Region
,CustomerID

--Exercise 25
SELECT TOP 3 ShipCountry, AVG(Freight) AS AverageFreight
FROM Orders
GROUP BY ShipCountry
ORDER BY AverageFreight DESC

--Exercise 26
SELECT TOP 3 ShipCountry,  AVG(Freight) AS AverageFreight
FROM Orders
WHERE YEAR(OrderDate) = '2015'
GROUP BY ShipCountry
ORDER BY AverageFreight DESC


--Exercise 27


--Exercise 28
SELECT TOP (3) ShipCountry, AVG(Freight) AS AverageFreight
FROM Orders
WHERE  OrderDate >= Dateadd(yy, -1, (Select max(OrderDate) from Orders))
GROUP BY ShipCountry
ORDER BY AverageFreight DESC

--Exercise 29
SELECT Employees.EmployeeID, Employees.LastName, Orders.OrderID, Products.ProductName, [Order Details].Quantity
FROM Employees
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Products ON Products.ProductID = [Order Details].ProductID
ORDER BY Orders.OrderID,Products.ProductID

--Exercise 30
SELECT Customers.CustomerID, Orders.CustomerID
FROM Customers
LEFT JOIN  Orders ON Orders.CustomerID = Customers.CustomerID 
WHERE Orders.CustomerID IS NULL

--Exercise 31
SELECT Customers.CustomerID, Orders.CustomerID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
	AND Orders.EmployeeID = 4
WHERE Orders.CustomerID IS NULL

