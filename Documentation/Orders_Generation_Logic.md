# Orders Generation Logic

## Purpose

The Orders dataset represents customer purchase transactions across all regions served by Redwood Logistics.

The dataset will be used as the primary fact table for revenue analysis, demand forecasting, inventory intelligence, logistics performance, and executive reporting.

--------------------------------------------------

## Date Range

January 1, 2023 to December 31, 2025

--------------------------------------------------

## Expected Row Count

Target Orders:

18,000 - 25,000

Recommended:

20,000 Orders

--------------------------------------------------

## Order Structure

Each order contains:

- Order_ID
- Order_Date
- Product_ID
- Supplier_ID
- Warehouse_ID
- Region_ID
- Quantity
- Revenue
- Fulfillment_Status

--------------------------------------------------

## Demand Behavior

Demand varies by product category.

Electronics:
Higher demand in November and December.

Home Appliances:
Higher demand between April and June.

Furniture:
Higher demand between June and August.

Personal Care:
Higher demand in February, November, and December.

Office Supplies:
Stable demand throughout the year.

--------------------------------------------------

## Regional Demand

Central Region:
Highest order volume.

North Region:
High order volume.

South Region:
Moderate order volume.

East Region:
Moderate order volume.

West Region:
Moderate order volume.

--------------------------------------------------

## Fulfillment Rules

Healthy Inventory:
95% fulfillment probability.

Low Stock:
75% fulfillment probability.

Critical Stock:
60% fulfillment probability.

--------------------------------------------------

## Revenue Calculation

Revenue = Quantity × Unit_Price

--------------------------------------------------

## Business Scenarios

Scenario 1:
SmartPhone Elite experiences periodic stockout risk.

Scenario 2:
Central Hub experiences occasional fulfillment delays.

Scenario 3:
Supplier Summit Supply Co contributes to higher lead times.

Scenario 4:
Electronics demand spikes during year-end periods.

Scenario 5:
Furniture demand increases during mid-year periods.