/*=========================================================
  KPI 1 : Business Snapshot
  Business Question:
  How big is Redwood Logistics?
=========================================================*/

SELECT
    COUNT(*) AS Total_Orders,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(AVG(Revenue), 2) AS Average_Order_Value
FROM orders;

/*=========================================================
  KPI 2 : Revenue by Region
  Business Question:
  Which regions contribute the most revenue?
=========================================================*/

SELECT
    r.Region_Name,
    ROUND(SUM(o.Revenue), 2) AS Revenue
FROM orders o
JOIN regions r
    ON o.Region_ID = r.Region_ID
GROUP BY r.Region_Name
ORDER BY Revenue DESC;

/*=========================================================
  KPI 3 : Revenue by Product Category
  Business Question:
  Which categories drive the business?
=========================================================*/

SELECT
    p.Category,
    ROUND(SUM(o.Revenue), 2) AS Revenue
FROM orders o
JOIN products p
    ON o.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY Revenue DESC;

/*=========================================================
  KPI 4 : Top 10 Revenue Generating Products
  Business Question:
  Which products generate the highest revenue?
=========================================================*/

SELECT
    p.Product_Name,
    ROUND(SUM(o.Revenue), 2) AS Revenue
FROM orders o
JOIN products p
    ON o.Product_ID = p.Product_ID
GROUP BY p.Product_Name
ORDER BY Revenue DESC
LIMIT 10;

/*=========================================================
  KPI 5 : Fulfillment Performance
  Business Question:
  How efficiently are orders fulfilled?
=========================================================*/

SELECT
    Fulfillment_Status,
    COUNT(*) AS Total_Orders,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER(),
        2
    ) AS Percentage
FROM orders
GROUP BY Fulfillment_Status;

/*=========================================================
  KPI 6 : Delivery Performance
  Business Question:
  How effectively are shipments delivered?
=========================================================*/

SELECT
    Delivery_Status,
    COUNT(*) AS Total_Shipments,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER(),
        2
    ) AS Percentage
FROM shipments
GROUP BY Delivery_Status;