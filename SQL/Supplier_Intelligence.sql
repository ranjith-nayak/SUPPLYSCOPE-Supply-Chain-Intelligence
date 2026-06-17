/*=========================================================
 KPI 1 : Supplier Portfolio Overview

 Business Question:
 How many suppliers exist and what is their
 average reliability score?
=========================================================*/

SELECT
    COUNT(*) AS Total_Suppliers,
    ROUND(AVG(Reliability_Score),2) AS Avg_Reliability
FROM suppliers;

/*=========================================================
 KPI 2 : Top Suppliers by Reliability

 Business Question:
 Which suppliers are the most reliable?
=========================================================*/

SELECT
    Supplier_Name,
    Reliability_Score
FROM suppliers
ORDER BY Reliability_Score DESC;

/*=========================================================
 KPI 3 : Lead Time Analysis

 Business Question:
 Which suppliers take the longest to deliver?
=========================================================*/

SELECT
    Supplier_Name,
    Lead_Time_Days
FROM suppliers
ORDER BY Lead_Time_Days DESC;

/*=========================================================
 KPI 4 : Supplier Type Distribution

 Business Question:
 What is the composition of our supplier network?
=========================================================*/

SELECT
    Supplier_Type,
    COUNT(*) AS Supplier_Count
FROM suppliers
GROUP BY Supplier_Type;

/*=========================================================
 KPI 5 : Supplier Revenue Contribution

 Business Question:
 Which suppliers support the highest revenue generation?
=========================================================*/

SELECT
    s.Supplier_Name,
    ROUND(SUM(o.Revenue),2) AS Revenue
FROM orders o
JOIN suppliers s
    ON o.Supplier_ID = s.Supplier_ID
GROUP BY s.Supplier_Name
ORDER BY Revenue DESC;

/*=========================================================
 KPI 6 : Supplier Order Volume

 Business Question:
 Which suppliers are handling the highest order volumes?
=========================================================*/

SELECT
    s.Supplier_Name,
    COUNT(o.Order_ID) AS Total_Orders
FROM orders o
JOIN suppliers s
    ON o.Supplier_ID = s.Supplier_ID
GROUP BY s.Supplier_Name
ORDER BY Total_Orders DESC;

/*=========================================================
 KPI 7 : High Risk Suppliers

 Business Question:
 Which suppliers have low reliability and
 high lead times?
=========================================================*/

SELECT
    Supplier_Name,
    Reliability_Score,
    Lead_Time_Days
FROM suppliers
WHERE Reliability_Score < 85
AND Lead_Time_Days > 10
ORDER BY Reliability_Score;