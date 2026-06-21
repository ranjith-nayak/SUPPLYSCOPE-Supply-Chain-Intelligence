/*=========================================================
 KPI 1 : Forecast Demand by Category

 Business Question:
 Which product categories are expected to
 generate the highest future demand?
=========================================================*/

SELECT
    Category,
    SUM(Forecast_Demand) AS Total_Forecast_Demand
FROM Demand_Forecast
GROUP BY Category
ORDER BY Total_Forecast_Demand DESC;


/*=========================================================
KPI 2 : Forecast Accuracy by Category

Business Question:
Which categories have the most accurate
demand forecasts?
=========================================================*/

SELECT
    Category,

    ROUND(
        AVG(
            REPLACE(Forecast_Accuracy,'%','')
        ),
        2
    ) AS Avg_Forecast_Accuracy

FROM demand_forecast

GROUP BY Category

ORDER BY Avg_Forecast_Accuracy DESC;

/*=========================================================
KPI 3 : Top Forecasted Products

Business Question:
Which products are expected to drive
future demand?
=========================================================*/

SELECT
    Product_Name,

    SUM(Forecast_Demand) AS Forecast_Demand,

    RANK() OVER(
        ORDER BY SUM(Forecast_Demand) DESC
    ) AS Demand_Rank

FROM demand_forecast

GROUP BY Product_Name;

/*=========================================================
KPI 4 : Demand Priority Distribution

Business Question:
How are products distributed across
priority levels?
=========================================================*/

SELECT
    Deamand_Priorty,

    COUNT(*) AS Product_Count,

    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*))
        OVER(),
        2
    ) AS Percentage_Share

FROM demand_forecast

GROUP BY Deamand_Priorty

ORDER BY Product_Count DESC;

/*=========================================================
KPI 5 : Monthly Forecast Trend

Business Question:
How does forecast demand change
throughout the year?
=========================================================*/

SELECT
    Forecast_Month,

    SUM(Forecast_Demand) AS Monthly_Forecast

FROM demand_forecast

GROUP BY Forecast_Month

ORDER BY
STR_TO_DATE(
    Forecast_Month,
    '%b-%y'
);

/*=========================================================
KPI 6 : Safety Stock Requirement

Business Question:
Which categories require the highest
inventory buffer?
=========================================================*/

SELECT
    Category,

    SUM(Safety_Stock) AS Total_Safety_Stock,

    DENSE_RANK() OVER(
        ORDER BY SUM(Safety_Stock) DESC
    ) AS Safety_Stock_Rank

FROM demand_forecast

GROUP BY Category;

/*=========================================================
KPI 7 : Inventory Risk Analysis

Business Question:
Which products face the highest
shortage risk?
=========================================================*/

SELECT
    Product_Name,

    SUM(Stock_Gap) AS Stock_Gap

FROM demand_forecast

GROUP BY Product_Name

ORDER BY Stock_Gap ASC

LIMIT 10;

/*=========================================================
KPI 8 : Forecast Planning Summary

Business Question:
What is the overall forecasting
performance by category?
=========================================================*/

SELECT
    Category,

    COUNT(DISTINCT Product_ID) AS Products,

    SUM(Forecast_Demand) AS Forecast_Demand,

    ROUND(
        AVG(
            REPLACE(Forecast_Accuracy,'%','')
        ),
        2
    ) AS Forecast_Accuracy,

    SUM(Safety_Stock) AS Safety_Stock

FROM demand_forecast

GROUP BY Category

ORDER BY Forecast_Demand DESC;