/*=========================================================
 KPI 1 : Logistics Overview

 Business Question:
 How many shipments have been processed and
 what is the total transportation cost?
=========================================================*/

SELECT
    COUNT(*) AS Total_Shipments,
    ROUND(SUM(Shipping_Cost),2) AS Total_Shipping_Cost,
    ROUND(AVG(Shipping_Cost),2) AS Avg_Shipping_Cost
FROM shipments;

/*=========================================================
 KPI 2 : Delivery Performance

 Business Question:
 What percentage of shipments are delivered on time?
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

/*=========================================================
 KPI 3 : Transport Mode Usage

 Business Question:
 Which transportation modes are used most frequently?
=========================================================*/

SELECT
    Transport_Mode,
    COUNT(*) AS Shipment_Count
FROM shipments
GROUP BY Transport_Mode
ORDER BY Shipment_Count DESC;

/*=========================================================
 KPI 4 : Transport Mode Cost Analysis

 Business Question:
 Which transportation modes incur the highest costs?
=========================================================*/

SELECT
    Transport_Mode,
    ROUND(SUM(Shipping_Cost),2) AS Total_Cost
FROM shipments
GROUP BY Transport_Mode
ORDER BY Total_Cost DESC;

/*=========================================================
 KPI 5 : Average Delivery Time

 Business Question:
 What is the average shipment delivery time?
=========================================================*/

SELECT
    ROUND(
        AVG(
            DATEDIFF(
                Delivery_Date,
                Ship_Date
            )
        ),
        2
    ) AS Avg_Delivery_Days
FROM shipments;

/*=========================================================
 KPI 6 : Transport Mode Delivery Time

 Business Question:
 Which transportation modes are fastest?
=========================================================*/

SELECT
    Transport_Mode,
    ROUND(
        AVG(
            DATEDIFF(
                Delivery_Date,
                Ship_Date
            )
        ),
        2
    ) AS Avg_Delivery_Days
FROM shipments
GROUP BY Transport_Mode
ORDER BY Avg_Delivery_Days;

/*=========================================================
 KPI 7 : Most Expensive Shipments

 Business Question:
 Which shipments incurred the highest logistics costs?
=========================================================*/

SELECT
    Shipment_ID,
    Transport_Mode,
    Shipping_Cost
FROM shipments
ORDER BY Shipping_Cost DESC
LIMIT 10;

/*=========================================================
 KPI 8 : Revenue vs Logistics Cost

 Business Question:
 Are logistics costs aligned with revenue generation?
=========================================================*/

SELECT
    ROUND(SUM(o.Revenue),2) AS Total_Revenue,
    ROUND(SUM(s.Shipping_Cost),2) AS Total_Logistics_Cost,
    ROUND(
        SUM(s.Shipping_Cost) /
        SUM(o.Revenue) * 100,
        2
    ) AS Logistics_Cost_Percentage
FROM orders o
JOIN shipments s
    ON o.Order_ID = s.Order_ID;