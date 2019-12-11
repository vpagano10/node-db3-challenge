-- Multi-Table Query Practice
-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

-- ✔
SELECT
    p.ProductName,
    c.CategoryName
FROM Product as p
JOIN Category as c
    ON c.id = p.CategoryId;
-- ✔


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

-- ✔
SELECT 
    o.Id as OrderId,
    s.CompanyName as Shipper,
    o.OrderDate
FROM [Order] as o
JOIN Shipper as s
    ON s.id = o.Shipvia
WHERE o.OrderDate < '2012-08-09'
ORDER BY OrderDate;
-- ✔


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

-- ✔
SELECT 
    od.OrderId,
    p.ProductName,
    od.Quantity
FROM OrderDetail as od
JOIN Product as p
    ON od.ProductID = p.id
WHERE OrderId = 10251;
-- ✔


-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

-- ✔
SELECT
    o.id as OrderId,
    c.CompanyName,
    e.LastName as EmployeeLastName
FROM [Order] as o
JOIN Customer as c
    ON c.id = o.CustomerId
JOIN Employee as e
    ON e.id = o.EmployeeId;
-- ✔