-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select p.ProductName, c.CategoryName
from Products as p
    join Categories as c on p.CategoryId = c.CategoryID;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select o.OrderID, s.ShipperName
from Orders as o
    join Shippers as s on o.ShipperID = s.ShipperID
where o.OrderDate < '2012-08-09';


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select p.ProductName, od.Quantity
from OrderDetails as od
    join Products as p on od.ProductId = p.ProductID
where OrderID = 10251;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select c.CategoryName, p.CategoryID as 'Count'
from Products as p
    left join Categories as c on p.CategoryID = c.CategoryID
group by CategoryName
