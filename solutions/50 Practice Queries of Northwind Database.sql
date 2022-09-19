/* 50 Practice Queries of Northwind Database*/

--Exercise 1 
SELECT CategoryName,Description
FROM Categories
ORDER BY CategoryName

--Exercise 2
SELECT ContactName, CompanyName, ContactTitle, Phone
FROM Customers
ORDER BY Phone

--Exercise 3
SELECT UPPER(FirstName) AS FirstName , UPPER(LastName) AS LastName, HireDate
FROM Employees
ORDER BY HireDate

--Exercise 4
SELECT TOP (10)  OrderID, OrderDate, ShippedDate, CustomerID
FROM Orders
ORDER BY Freight DESC

--Exercise 5
SELECT LOWER(CustomerID) AS CustomerID
FROM Customers

--Exercise 6
SELECT CompanyName, Fax, Phone, Country, HomePage
FROM Suppliers
ORDER BY Country DESC, CompanyName 

--Exercise 7
SELECT CompanyName, ContactName
FROM Customers
WHERE City = 'Buenos Aires'

--Exercise 8
SELECT ProductName, UnitPrice, QuantityPerUnit
FROM Products
WHERE Discontinued = 1

--Exercise 9
SELECT ContactName, Address, City
FROM Customers
WHERE Country NOT IN('Germany','Mexico','Spain')

--Exercise 10
SELECT OrderDate, ShippedDate, CustomerID, Freight
FROM Orders
WHERE OrderDate = '1996-08-21'

--Exercise 11
SELECT FirstName, LastName, Country
FROM Employees
WHERE Country <> 'USA'

--Exercise 12
SELECT EmployeeID, OrderID, RequiredDate, ShippedDate
FROM Orders
WHERE ShippedDate > RequiredDate 

--Exercise 13
SELECT City, CompanyName, ContactName
FROM Customers
WHERE City LIKE 'A%' OR City LIKE 'B%'

--Exercise 14
SELECT OrderID
FROM Orders
WHERE OrderID % 2 = 0

--Exercise 15
SELECT *
FROM Orders
WHERE Freight > 500

--Exercise 16
SELECT ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel 
FROM Products
WHERE ReorderLevel = 0

--Exercise 17
SELECT CompanyName,ContactName, Fax
FROM Customers
WHERE Fax IS NULL

--Exercise 18
SELECT FirstName, LastName
FROM Employees
WHERE ReportsTo IS NULL

--Exercise 19
SELECT OrderID 
FROM Orders
WHERE OrderID % 2 = 1

--Exercise 20
SELECT  CompanyName, ContactName, Fax
FROM Customers
WHERE Fax IS NULL
ORDER BY ContactName

--Exercise 21
SELECT City, CompanyName, ContactName
FROM Customers
WHERE City LIKE '%L'

--Exercise 22
SELECT FirstName, LastName, CONVERT(DATE,BirthDate) AS BirthDate
FROM Employees
WHERE BirthDate BETWEEN '1950-01-01' AND '1959-12-31'

--Exercise 23
SELECT FirstName, LastName, YEAR(BirthDate) AS BirthDate
FROM Employees

--Exercise 24
SELECT OrderID, COUNT(OrderID) as NumberofOrders
FROM [Order Details]
GROUP BY OrderID 
ORDER BY NumberofOrders DESC

--Exercise 25
SELECT Suppliers.SupplierID, Products.ProductName, Suppliers.CompanyName
FROM Suppliers
INNER JOIN Products ON Suppliers.SupplierID = Products.SupplierID
WHERE CompanyName IN('Exotic Liquids','Specialty Biscuits, Ltd.','Escargots Nouveaux')
ORDER BY SupplierID

--Exercise 26
SELECT ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress
FROM Orders
WHERE ShipPostalCode = '98124'

--Exercise 27
SELECT ContactName, ContactTitle, CompanyName
FROM Customers
WHERE ContactTitle NOT LIKE '%Sales%'

--Exercise 28
SELECT FirstName, LastName, City
FROM Employees
WHERE City <> 'Seattle'

--Exercise 29
SELECT  CompanyName, ContactTitle, City, Country 
FROM Customers
WHERE Country IN('Mexico','Spain') AND City <> 'Madrid'

--Exercise 30
SELECT CONCAT(FirstName,LastName, 'can be reached at ','x',Extension) AS ContactInfo
FROM Employees

--Exercise 31
SELECT ContactName
FROM Customers
WHERE ContactName NOT LIKE '_A%'

--Exercise 32
SELECT ROUND(AVG(UnitPrice),0) AS AveragePrice, 
SUM(UnitsInStock) AS TotalStock, 
MAX(UnitsOnOrder) AS MaxOrder
FROM Products

--Exercise 33
SELECT Suppliers.SupplierID, CompanyName, Categories.CategoryName, Products.ProductName, Products.UnitPrice 
FROM Suppliers
INNER JOIN Products ON Suppliers.SupplierID = Products.SupplierID
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID

--Exercise 34
SELECT CustomerID, SUM(Freight) AS Freight
FROM Orders
GROUP BY CustomerID
HAVING SUM(Freight) > 200

--Exercise 35
SELECT  o.OrderID,c.CompanyName, UnitPrice, od.Quantity, od.Discount
FROM [Order Details] AS od
INNER JOIN Orders AS o ON o.OrderID = od.OrderID
INNER JOIN Customers AS c ON c.CustomerID = o.CustomerID
WHERE od.Discount <> 0

--Exercise 36
SELECT a.EmployeeID,
CONCAT(a.FirstName,' ',a.LastName) AS Employee,
CONCAT(b.FirstName,' ',b.LastName) AS Manager
FROM Employees AS a
LEFT JOIN Employees AS b ON b.EmployeeID = a.ReportsTo

--Exercise 37
SELECT AVG(UnitPrice) AS AveragePrice,
	   MIN(UnitPrice) AS MinimumPrice,
	   MAX(UnitPrice) AS MaximumPrice
FROM Products 

--Exercise 38
CREATE VIEW CustomerInfo AS
SELECT Customers.CustomerID, CompanyName, ContactName, ContactTitle, Address, City,
Country, Phone, OrderDate, RequiredDate, ShippedDate
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID

--Exercise 39

--Exercise 40
CREATE VIEW ProductDetails AS
SELECT ProductID, CompanyName, ProductName, CategoryName, Description,QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
FROM Suppliers
INNER JOIN Products ON Products.SupplierID = Suppliers.SupplierID
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID


--Exercise 41
DROP VIEW IF EXISTS CustomerInfo

--Exercise 42
SELECT SUBSTRING(CategoryName,1,5) AS ShortInfo
FROM Categories

--Exercise 43

--Exercise 44


--Exercise 45
SELECT Suppliers.CompanyName, Products.ProductName
FROM  Categories
INNER JOIN  Products ON Products.CategoryID = Categories.CategoryID
INNER JOIN  Suppliers ON Suppliers.SupplierID = Products.SupplierID
WHERE CategoryName = 'Seafood'

--Exercise 46
SELECT Categories.CategoryID,Suppliers.CompanyName, Products.ProductName
FROM Categories
INNER JOIN Products ON Products.CategoryID = Categories.CategoryID
INNER JOIN  Suppliers ON Suppliers.SupplierID = Products.SupplierID
WHERE Categories.CategoryID = 5

--Exercise 47


--Exercise 48
SELECT LastName, FirstName, Title,CONCAT(DATEDIFF(YEAR,CONVERT(DATE,BirthDate),GETDATE()),' Years') AS Age
FROM Employees


--Exercise 49
SELECT Customers.CompanyName, COUNT(Customers.CustomerID) AS NumberOfOrders
FROM Customers
INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.OrderDate = '1996-12-31'
GROUP BY CompanyName
HAVING COUNT(Customers.CustomerID) > 10

--Exercise 50
SELECT CONCAT(ProductName,' ','weighs/is',QuantityPerUnit,'and cost',' ','$',UnitPrice) AS ProductInfo
FROM Products
