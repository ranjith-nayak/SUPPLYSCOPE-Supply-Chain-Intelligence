CREATE DATABASE supplyscope;

USE supplyscope;

CREATE TABLE products (

    Product_ID VARCHAR(10) PRIMARY KEY,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Unit_Cost DECIMAL(10,2),
    Unit_Price DECIMAL(10,2),
    Demand_Type VARCHAR(20)

);

CREATE TABLE suppliers (

    Supplier_ID VARCHAR(10) PRIMARY KEY,
    Supplier_Name VARCHAR(100),
    Country VARCHAR(50),
    Reliability_Score INT,
    Lead_Time_Days INT,
    Supplier_Type VARCHAR(20)

);

CREATE TABLE warehouses (

    Warehouse_ID VARCHAR(10) PRIMARY KEY,
    Warehouse_Name VARCHAR(100),
    Region VARCHAR(50),
    Capacity INT,
    Utilization INT,
    Warehouse_Type VARCHAR(20)

);

CREATE TABLE regions (

    Region_ID VARCHAR(10) PRIMARY KEY,
    Region_Name VARCHAR(50)

);

CREATE TABLE inventory (

    Inventory_ID VARCHAR(10) PRIMARY KEY,
    Product_ID VARCHAR(10),
    Warehouse_ID VARCHAR(10),
    Stock_Level INT,
    Reorder_Point INT,
    Inventory_Status VARCHAR(30)

);

CREATE TABLE orders (

    Order_ID VARCHAR(20) PRIMARY KEY,
    Order_Date DATE,
    Product_ID VARCHAR(10),
    Supplier_ID VARCHAR(10),
    Warehouse_ID VARCHAR(10),
    Region_ID VARCHAR(10),
    Quantity INT,
    Revenue DECIMAL(12,2),
    Fulfillment_Status VARCHAR(20)

);

CREATE TABLE shipments (

    Shipment_ID VARCHAR(20) PRIMARY KEY,
    Order_ID VARCHAR(20),
    Transport_Mode VARCHAR(50),
    Shipping_Cost DECIMAL(10,2),
    Ship_Date DATE,
    Delivery_Date DATE,
    Delivery_Status VARCHAR(20)

);

SHOW TABLES;

SELECT * FROM products;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM suppliers;
SELECT COUNT(*) FROM warehouses;
SELECT COUNT(*) FROM regions;
SELECT COUNT(*) FROM inventory;

TRUNCATE TABLE orders;
SELECT COUNT(*)
FROM orders;
TRUNCATE TABLE orders;
SELECT COUNT(*)
FROM orders;
TRUNCATE TABLE orders;
SHOW VARIABLES LIKE 'local_infile';
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';

TRUNCATE TABLE orders;

LOAD DATA LOCAL INFILE 'C:\Users\user\Desktop\SupplyScope\Dataset\Orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
Order_ID,
Order_Date,
Product_ID,
Supplier_ID,
Warehouse_ID,
Region_ID,
Quantity,
Revenue,
Fulfillment_Status
);

TRUNCATE TABLE orders;
SELECT COUNT(*) AS Total_Orders
FROM orders;
SELECT VERSION();

CREATE TABLE orders_test LIKE orders;
DROP TABLE orders_test;
SELECT COUNT(*) FROM inventory;
TRUNCATE TABLE orders;

CREATE TABLE orders (

    Order_ID VARCHAR(20) PRIMARY KEY,

    Order_Date DATE,

    Product_ID VARCHAR(10),

    Supplier_ID VARCHAR(10),

    Warehouse_ID VARCHAR(10),

    Region_ID VARCHAR(10),

    Quantity INT,

    Revenue DECIMAL(12,2),

    Fulfillment_Status VARCHAR(20)

);

SHOW TABLES;
DESCRIBE orders;
DROP TABLE orders;
CREATE TABLE orders (

    Order_ID VARCHAR(20) PRIMARY KEY,

    Order_Date DATE,

    Product_ID VARCHAR(10),

    Supplier_ID VARCHAR(10),

    Warehouse_ID VARCHAR(10),

    Region_ID VARCHAR(10),

    Quantity INT,

    Revenue DECIMAL(12,2),

    Fulfillment_Status VARCHAR(20)

);

DESCRIBE orders;
TRUNCATE TABLE orders;

LOAD DATA LOCAL INFILE 'C:/Users/user/Desktop/SupplyScope/Dataset/Orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
Order_ID,
Order_Date,
Product_ID,
Supplier_ID,
Warehouse_ID,
Region_ID,
Quantity,
Revenue,
Fulfillment_Status
);

SHOW VARIABLES LIKE 'local_infile';

TRUNCATE TABLE orders;
LOAD DATA LOCAL INFILE 'C:/Users/user/Desktop/SupplyScope/Dataset/Orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
Order_ID,
Order_Date,
Product_ID,
Supplier_ID,
Warehouse_ID,
Region_ID,
Quantity,
Revenue,
Fulfillment_Status
);

SELECT COUNT(*) AS Total_Orders
FROM orders;
SELECT
    ROUND(SUM(Revenue),2) AS Total_Revenue
FROM orders;
SELECT
    Fulfillment_Status,
    COUNT(*) AS Total
FROM orders
GROUP BY Fulfillment_Status;

DESCRIBE shipments;
SELECT COUNT(*) AS Total_Shipments
FROM shipments;

SELECT COUNT(*) AS Total_Orders
FROM orders;

SELECT
ROUND(SUM(Revenue),2) AS Total_Revenue
FROM orders;

SELECT
Fulfillment_Status,
COUNT(*) AS Total
FROM orders
GROUP BY Fulfillment_Status;

SELECT
Delivery_Status,
COUNT(*) AS Total
FROM shipments
GROUP BY Delivery_Status;