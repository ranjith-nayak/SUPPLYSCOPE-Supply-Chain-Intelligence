/*=========================================================
 KPI 1 : Inventory Status Distribution

 Business Question:
 How healthy is our inventory portfolio?
=========================================================*/

SELECT
    Inventory_Status,
    COUNT(*) AS Product_Count
FROM inventory
GROUP BY Inventory_Status;


/*=========================================================
 KPI 2 : Average Stock by Warehouse

 Business Question:
 Which warehouses maintain the highest stock levels?
=========================================================*/

SELECT
    Warehouse_ID,
    ROUND(AVG(Stock_Level), 2) AS Avg_Stock
FROM inventory
GROUP BY Warehouse_ID
ORDER BY Avg_Stock DESC;

/*=========================================================
 KPI 3 : Reorder Risk Analysis

 Business Question:
 Which products are at risk of stockout and
 require immediate replenishment?
=========================================================*/

SELECT
    Product_ID,
    Stock_Level,
    Reorder_Point
FROM inventory
WHERE Stock_Level <= Reorder_Point
ORDER BY Stock_Level;

/*=========================================================
 KPI 4 : Inventory by Product Category

 Business Question:
 Which product categories consume the most inventory?
=========================================================*/

SELECT
    p.Category,
    SUM(i.Stock_Level) AS Total_Stock
FROM inventory i
JOIN products p
    ON i.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY Total_Stock DESC;

/*=========================================================
 KPI 5 : Total Inventory Value

 Business Question:
 How much capital is tied up in inventory?
=========================================================*/

SELECT
    ROUND(
        SUM(i.Stock_Level * p.Unit_Cost),
        2
    ) AS Inventory_Value
FROM inventory i
JOIN products p
    ON i.Product_ID = p.Product_ID;
    
    /*=========================================================
 KPI 6 : Warehouse Inventory Value

 Business Question:
 Which warehouses hold the highest inventory value?
=========================================================*/

SELECT
    i.Warehouse_ID,
    ROUND(
        SUM(i.Stock_Level * p.Unit_Cost),
        2
    ) AS Inventory_Value
FROM inventory i
JOIN products p
    ON i.Product_ID = p.Product_ID
GROUP BY i.Warehouse_ID
ORDER BY Inventory_Value DESC;

/*=========================================================
 KPI 7 : Top 10 Highest Stocked Products

 Business Question:
 Which products occupy the largest inventory volume?
=========================================================*/

SELECT
    p.Product_Name,
    i.Stock_Level
FROM inventory i
JOIN products p
    ON i.Product_ID = p.Product_ID
ORDER BY i.Stock_Level DESC
LIMIT 10;