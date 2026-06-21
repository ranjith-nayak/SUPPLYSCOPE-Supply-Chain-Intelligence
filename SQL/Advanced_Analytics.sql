/*=========================================================
 KPI 1 : Top Revenue Products Ranking

 Business Question:
 Which products generate the highest revenue?
=========================================================*/

SELECT
    p.Product_Name,
    ROUND(SUM(o.Revenue),2) AS Revenue,
    RANK() OVER(
        ORDER BY SUM(o.Revenue) DESC
    ) AS Revenue_Rank
FROM orders o
JOIN products p
    ON o.Product_ID = p.Product_ID
GROUP BY p.Product_Name;

/*=========================================================
 KPI 2 : Regional Revenue Ranking

 Business Question:
 Which regions contribute most to revenue?
=========================================================*/

SELECT
    r.Region_Name,
    ROUND(SUM(o.Revenue),2) AS Revenue,
    DENSE_RANK() OVER(
        ORDER BY SUM(o.Revenue) DESC
    ) AS Region_Rank
FROM orders o
JOIN regions r
    ON o.Region_ID = r.Region_ID
GROUP BY r.Region_Name;

/*=========================================================
 KPI 3 : Running Revenue Trend

 Business Question:
 How does cumulative revenue grow over time?
=========================================================*/

SELECT
    Order_Date,
    Daily_Revenue,

    SUM(Daily_Revenue)
    OVER(
        ORDER BY Order_Date
    ) AS Running_Revenue

FROM (

    SELECT
        Order_Date,
        SUM(Revenue) AS Daily_Revenue
    FROM orders
    GROUP BY Order_Date

) revenue_data;


/*=========================================================
 KPI 4 : Top Supplier by Revenue

 Business Question:
 Which suppliers support the most revenue?
=========================================================*/

WITH supplier_revenue AS (

    SELECT
        s.Supplier_Name,
        ROUND(SUM(o.Revenue),2) AS Revenue

    FROM orders o
    JOIN suppliers s
        ON o.Supplier_ID = s.Supplier_ID

    GROUP BY s.Supplier_Name

)

SELECT *
FROM supplier_revenue
ORDER BY Revenue DESC;


/*=========================================================
 KPI 5 : Revenue Contribution %

 Business Question:
 What percentage of total revenue does each
 category contribute?
=========================================================*/

SELECT
    p.Category,

    ROUND(
        SUM(o.Revenue),
        2
    ) AS Revenue,

    ROUND(
        SUM(o.Revenue) * 100 /
        SUM(SUM(o.Revenue))
        OVER(),
        2
    ) AS Revenue_Percentage

FROM orders o
JOIN products p
    ON o.Product_ID = p.Product_ID

GROUP BY p.Category;


/*=========================================================
 KPI 6 : Supplier Reliability Ranking

 Business Question:
 Which suppliers are the most reliable?
=========================================================*/

SELECT
    Supplier_Name,

    Reliability_Score,

    RANK() OVER(
        ORDER BY Reliability_Score DESC
    ) AS Supplier_Rank

FROM suppliers;