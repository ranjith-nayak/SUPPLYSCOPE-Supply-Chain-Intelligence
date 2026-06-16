# Data Dictionary - SUPPLYSCOPE

## Overview

This document defines all datasets, tables, columns, and business definitions used within the SUPPLYSCOPE platform.

The data model represents the end-to-end supply chain operations of Redwood Logistics, including suppliers, inventory, warehouses, logistics operations, customer orders, and demand forecasting.

---

# Dataset Summary

| Table Name     | Type      |
| -------------- | --------- |
| Fact_Orders    | Fact      |
| Fact_Inventory | Fact      |
| Dim_Product    | Dimension |
| Dim_Supplier   | Dimension |
| Dim_Warehouse  | Dimension |
| Dim_Shipment   | Dimension |
| Dim_Region     | Dimension |
| Dim_Date       | Dimension |

---

# Fact_Orders

Purpose:

Stores customer order transactions.

| Column Name        | Data Type | Description                 |
| ------------------ | --------- | --------------------------- |
| Order_ID           | Integer   | Unique order identifier     |
| Order_Date         | Date      | Date order was placed       |
| Product_ID         | String    | Product reference           |
| Supplier_ID        | String    | Supplier reference          |
| Warehouse_ID       | String    | Warehouse reference         |
| Shipment_ID        | String    | Shipment reference          |
| Region_ID          | String    | Customer region             |
| Quantity           | Integer   | Units ordered               |
| Revenue            | Decimal   | Revenue generated           |
| Fulfillment_Status | String    | Fulfilled, Delayed, Pending |

---

# Fact_Inventory

Purpose:

Stores warehouse inventory information.

| Column Name      | Data Type | Description                   |
| ---------------- | --------- | ----------------------------- |
| Inventory_ID     | Integer   | Unique inventory record       |
| Product_ID       | String    | Product reference             |
| Warehouse_ID     | String    | Warehouse reference           |
| Stock_Level      | Integer   | Current inventory quantity    |
| Reorder_Point    | Integer   | Minimum stock threshold       |
| Inventory_Value  | Decimal   | Current inventory value       |
| Inventory_Status | String    | Healthy, Low Stock, Overstock |

---

# Dim_Product

Purpose:

Stores product master data.

| Column Name  | Data Type | Description               |
| ------------ | --------- | ------------------------- |
| Product_ID   | String    | Unique product identifier |
| Product_Name | String    | Product name              |
| Category     | String    | Product category          |
| Unit_Cost    | Decimal   | Procurement cost          |
| Unit_Price   | Decimal   | Selling price             |

---

# Dim_Supplier

Purpose:

Stores supplier information.

| Column Name       | Data Type | Description                |
| ----------------- | --------- | -------------------------- |
| Supplier_ID       | String    | Unique supplier identifier |
| Supplier_Name     | String    | Supplier name              |
| Country           | String    | Supplier country           |
| Lead_Time_Days    | Integer   | Average supplier lead time |
| Reliability_Score | Decimal   | Supplier reliability score |

---

# Dim_Warehouse

Purpose:

Stores warehouse information.

| Column Name    | Data Type | Description                      |
| -------------- | --------- | -------------------------------- |
| Warehouse_ID   | String    | Unique warehouse identifier      |
| Warehouse_Name | String    | Warehouse name                   |
| Region         | String    | Operating region                 |
| Capacity       | Integer   | Warehouse capacity               |
| Utilization    | Decimal   | Warehouse utilization percentage |

---

# Dim_Shipment

Purpose:

Stores shipment and logistics information.

| Column Name     | Data Type | Description                |
| --------------- | --------- | -------------------------- |
| Shipment_ID     | String    | Unique shipment identifier |
| Transport_Mode  | String    | Air, Road, Rail, Courier   |
| Shipping_Cost   | Decimal   | Shipment cost              |
| Ship_Date       | Date      | Dispatch date              |
| Delivery_Date   | Date      | Delivery date              |
| Delivery_Status | String    | On-Time, Delayed           |

---

# Dim_Region

Purpose:

Stores regional information.

| Column Name | Data Type | Description              |
| ----------- | --------- | ------------------------ |
| Region_ID   | String    | Unique region identifier |
| Region_Name | String    | Region name              |

Regions:

* North
* South
* East
* West
* Central

---

# Dim_Date

Purpose:

Supports time intelligence and forecasting.

| Column Name | Data Type | Description    |
| ----------- | --------- | -------------- |
| Date        | Date      | Calendar date  |
| Day         | Integer   | Day number     |
| Month       | String    | Month name     |
| Quarter     | Integer   | Quarter number |
| Year        | Integer   | Year           |
| Week        | Integer   | Week number    |

---

# Business Assumptions

The dataset follows the following assumptions:

* Suppliers have different lead times.
* Supplier reliability impacts fulfillment.
* Inventory shortages impact order completion.
* Warehouses have capacity limitations.
* Transportation modes have different costs and delivery times.
* Customer demand varies by product and season.
* Logistics delays impact delivery performance.

---

# Date Range

January 2023 - December 2025

---

# Expected Dataset Size

| Table          | Estimated Rows |
| -------------- | -------------- |
| Fact_Orders    | 18,000         |
| Fact_Inventory | 125            |
| Dim_Product    | 25             |
| Dim_Supplier   | 10             |
| Dim_Warehouse  | 5              |
| Dim_Shipment   | 18,000         |
| Dim_Region     | 5              |
| Dim_Date       | ~1,095         |
