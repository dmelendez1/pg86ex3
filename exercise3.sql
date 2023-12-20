-- Exercise 3
/* List product id, product name, unit price and category name of all products. order by categroy anme & w/n that by product anme*/
 SELECT p.ProductID
	, p.ProductName
    , p.UnitPrice
    , c.CategoryName
FROM products AS p
INNER JOIN categories AS c
ON p.CategoryID = c.CategoryID
ORDER BY c.CategoryName
	, p.ProductName
    ;
/* list the product is, product name, unit price and supplier name of all products that cost more than $75. order by product name*/
SELECT p.ProductID
	, p.ProductName
    , p.UnitPrice
    , s.CompanyName AS SupplierName
FROM products AS p
INNER JOIN suppliers AS s
ON p.SupplierID = s.SupplierID
WHERE p.UnitPrice > 75
ORDER BY p.ProductName
;    

/* list the product id, product name, unit price, category name, & supplier name of every product. order by product name*/
SELECT  p.ProductID
	, p.ProductName
    , p.UnitPrice
    , c.CategoryName
    , s.CompanyName AS SupplierName
FROM products AS p
INNER JOIN categories AS c
ON p.CategoryID = c.CategoryID
INNER JOIN suppliers AS s
ON p.SupplierID = s.SupplierID
ORDER BY  p.ProductName
;

/*What is the product name(s) * categories of the most expensive products? Find max price in a subquery & use that in your more complex query that joins products with categories.*/
SELECT p.ProductName
	, c.CategoryName
    , p.UnitPrice
FROM products AS p
INNER JOIN categories AS c
ON p.CategoryID = c.CategoryID
WHERE p.UnitPrice = ( SELECT MAX(UnitPrice)
					 FROM products)
                     ;
	
/* List the order id, ship name, ship address * shipping company name of every order that shipped to germany*/
SELECT o.OrderID
    , o.ShipName
    , o.ShipAddress
    , sh.CompanyName AS ShippingCoName
FROM orders AS o
INNER JOIN customers AS cust
ON o.CustomerID = cust.CustomerID
INNER JOIN shippers AS sh
ON o.ShipVia = sh.ShipperID  /* ShipVia on orders table and ShipperID on shipper table are the same*/
WHERE cust.Country = 'Germany'
;

/* list the order id, order date, ship name, ship address of all orders that ordered "Sasquatch Ale" */
SELECT o.OrderID
	, o.OrderDate
    , o.ShipName
    , o.ShipAddress
FROM orders AS o
INNER JOIN `order details` AS od
ON o.OrderID = od.OrderID
INNER JOIN products AS p
ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Sasquatch Ale'
;