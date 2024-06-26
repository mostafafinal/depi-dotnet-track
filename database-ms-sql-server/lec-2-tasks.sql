-- Task 1
SELECT e.EmployeeID, e.FirstName FROM Employees e
WHERE e.EmployeeID NOT IN (SELECT EmployeeID FROM Orders)

-- Task 2
SELECT o.OrderID, o.OrderDate, p.ProductID, p.ProductName, od.Quantity FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON p.ProductID = od.ProductID
WHERE YEAR(o.OrderDate) IN (1998);

-- Task 3
SELECT ProductID, ProductName FROM Products
WHERE ProductID NOT IN (SELECT ProductID FROM [Order Details]);


-- Task 4
SELECT p.ProductName, s.CompanyName, c.CategoryName FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID
JOIN Categories c ON p.CategoryID = c.CategoryID

-- Task 5
SELECT OrderID, OrderDate, ShippedDate,
	CASE 
		WHEN DATEDIFF(day, OrderDate, ShippedDate) = 5 THEN 'On Time'
		ELSE'Late'
	END AS	Timing
FROM Orders