-- Q: How many warehouses are there and what is the one with the most capacity?
SELECT *
FROM warehouses;
-- A:There are four warehouses. Warehouse C has the most capacity, at only 50% filled.

-- Q: Liist all the products of this company.
SELECT *
FROM products;
-- A: This is the total number of all the products in this company.
SELECT COUNT(*)
FROM products;
-- A: The company currently carries 110 diifferent products.

-- Q: Verify whether any products are stored in multiple warehouses.
SELECT 
  productCode, 
  COUNT(warehouseCode) AS warehouse
  FROM products
  GROUP BY productCode
  HAVING COUNT(warehouseCode) > 1;
-- A: There are no products stored in multiple warehouses.


-- Q: Identify unique product count and their total stock on each warehouse.
SELECT 
    p.warehouseCode, 
    w.warehouseName, 
    COUNT(productCode) AS total_product, 
    SUM(p.quantityInStock) AS total_stock 
FROM 
    products AS p 
JOIN 
    warehouses AS w ON p.warehouseCode = w.warehouseCode 
GROUP BY 
    p.warehouseCode, 
    w.warehouseName 
 LIMIT  0, 1000;
-- A: Warehouse B has the most products stored, with 38 different products and a total of 219,183 of products in stock.

-- Q: Identify what product line each warehouse stored.
SELECT 
    p.warehouseCode, 
    w.warehouseName, 
    p.productLine, 
    COUNT(p.productCode) AS total_product, 
    SUM(p.quantityInStock) AS total_stock 
FROM 
    products AS p 
JOIN 
    warehouses AS w ON p.warehouseCode = w.warehouseCode 
GROUP BY 
    p.warehouseCode, 
    w.warehouseName, 
    p.productLine 
LIMIT 
    0, 1000;

-- A: Warehouse A (North): planes + motorcycles  
--  12 planes, 13 motorcycles = 25 total products  
  
-- Warehouse B (East): classic cars  
--  38 total products for classic cars  
  
-- Warehouse C (West): vintage cars  
--  24 total products for vintage cars  
  
-- Warehouse D (South): Trucks + buses, ships, trains  
--  11 trucks + buses, 9 ships, 3 trains = 23 total  

-- Q: Which product line has the highest number and lowest number of sales?
SELECT products.productLine, count(orderdetails.productCode) AS no_of_sales
FROM products 
JOIN orderdetails 
ON products.productCode = orderdetails.productCode
GROUP By products.productLine
ORDER BY no_of_sales desc;
--A: The product line that has the highest number of sales are the classic cars, with 1010 sold, and the lowest number of sales are trains with only 81 sold.

-- Q: Create a inventory_summảry table to indicate the product lines status.

CREATE TEMPORARY TABLE inventory_summary AS(
 SELECT
  p.warehouseCode AS warehouseCode,
  p.productCode AS productCode,
        p.productName AS productName,
  p.quantityInStock AS quantityInStock,
  SUM(od.quantityOrdered) AS total_ordered,
  p.quantityInStock - SUM(od.quantityOrdered) AS remaining_stock,
  CASE 
   WHEN (p.quantityInStock - SUM(od.quantityOrdered)) > (2 * SUM(od.quantityOrdered)) THEN 'Overstocked'
   WHEN (p.quantityInStock - SUM(od.quantityOrdered)) < 650 THEN 'Understocked'
   ELSE 'Well-Stocked'
  END AS inventory_status
 FROM products AS p
 JOIN orderdetails AS od ON p.productCode = od.productCode
 JOIN orders o ON od.orderNumber = o.orderNumber
 WHERE o.status IN ('Shipped', 'Resolved')
 GROUP BY 
  p.warehouseCode,
  p.productCode,
  p.quantityInStock
);
--A: 

-- Q: How many products are over stocked and under stocked on each warehouse?
SELECT
    warehouseCode,
    inventory_status,
    COUNT(*) AS product_count
FROM inventory_summary
GROUP BY warehouseCode, inventory_status
order by warehouseCode;

SELECT
    warehouseCode,
    COUNT(*) as product_overstocked
FROM inventory_summary
WHERE inventory_status = 'Overstocked'
GROUP BY warehouseCode;
--A: Warehouse B is having the highest overstocked product with total 29 products, while warehouse a and c having same 19 overstocked products.

-- Q: Analyze various product lines, identifying those with the highest sales percentages, and gain insights into each product line's inventory and sales performance.
SELECT
p.productLine,
pl.textDescription AS productLineDescription,
SUM(p.quantityInStock) AS totalInventory,
SUM(od.quantityOrdered) AS totalSales,
SUM(od.priceEach * od.quantityOrdered) AS totalRevenue,
(SUM(od.quantityOrdered) / SUM(p.quantityInStock)) * 100 AS salesToInventoryPercentage
FROM

mintclassics.products AS p
LEFT JOIN
mintclassics.productlines AS pl ON p.productLine = pl.productLine
LEFT JOIN
mintclassics.orderdetails AS od ON p.productCode = od.productCode
GROUP BY
p.productLine, pl.textDescription
ORDER BY
salesToInventoryPercentage desc
--A: Classic cars have the highest sales percentages with $3,853,922.49 in total revenue and 61% Sales to Inentory Percentage
