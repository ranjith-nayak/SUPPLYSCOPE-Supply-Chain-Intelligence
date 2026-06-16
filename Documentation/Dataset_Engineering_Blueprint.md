# Dataset Engineering Blueprint - SUPPLYSCOPE

## Purpose

This document defines the business simulation rules, operational assumptions, demand patterns, supplier behaviors, inventory conditions, logistics characteristics, and forecasting scenarios used to generate realistic supply chain data for the SUPPLYSCOPE platform.

The objective is to create a dataset that reflects real-world supply chain operations and supports meaningful business analysis across inventory, logistics, supplier performance, warehouse operations, and demand forecasting.

--------------------------------------------------

## Redwood Logistics Overview

Redwood Logistics operates a multi-region supply chain network consisting of suppliers, warehouses, transportation systems, and customer fulfillment operations.

The company distributes products across multiple categories and serves customers through regional distribution hubs.

Operational performance is influenced by supplier reliability, inventory availability, warehouse efficiency, transportation performance, and customer demand.

--------------------------------------------------

## Product Strategy

Redwood Logistics distributes products across five major categories:

- Electronics
- Home Appliances
- Furniture
- Office Supplies
- Personal Care

The product portfolio contains 25 products.

Products vary in:

- Demand volume
- Revenue contribution
- Inventory turnover
- Seasonal behavior

--------------------------------------------------

## Supplier Strategy

Suppliers are assigned different performance characteristics.

Supplier Types:

High Performing Suppliers

Characteristics:
- Reliability above 90%
- Lead time between 2 and 5 days

Average Suppliers

Characteristics:
- Reliability between 80% and 90%
- Lead time between 5 and 10 days

Underperforming Suppliers

Characteristics:
- Reliability below 80%
- Lead time above 10 days

Supplier performance directly impacts inventory availability and fulfillment efficiency.

--------------------------------------------------

## Warehouse Strategy

Redwood Logistics operates five regional warehouses.

Warehouses:

- North Hub
- South Hub
- East Hub
- West Hub
- Central Hub

Business Assumptions:

- Central Hub processes the highest order volume.
- Central Hub experiences higher utilization levels.
- Higher utilization may increase fulfillment delays.
- Inventory distribution varies across warehouses.

--------------------------------------------------

## Demand Strategy

Customer demand varies by product category and season.

Seasonal Demand Rules:

Electronics

High demand during:
- November
- December

Home Appliances

High demand during:
- April
- May
- June

Furniture

High demand during:
- June
- July
- August

Personal Care

High demand during:
- February
- November
- December

Demand fluctuations create inventory planning challenges and stockout risks.

--------------------------------------------------

## Logistics Strategy

Products are delivered using multiple transportation modes.

Transportation Modes:

- Air
- Road
- Rail
- Express Courier
- Standard Shipping

Business Assumptions:

- Air shipments have lower delivery times and higher costs.
- Rail shipments have lower costs and longer delivery times.
- Standard Shipping has the highest probability of delays.
- Transportation performance varies by region.

--------------------------------------------------

## Inventory Strategy

Inventory levels are monitored using reorder points.

Business Rules:

- Products falling below reorder points are considered at stockout risk.
- Excess inventory contributes to higher holding costs.
- Fast-moving products require frequent replenishment.
- Slow-moving products may become dead stock.

--------------------------------------------------

## Business Scenarios

The dataset intentionally includes operational challenges.

Scenario 1:
Supplier delays increase inventory shortages.

Scenario 2:
Inventory shortages create fulfillment delays.

Scenario 3:
Fulfillment delays affect shipment performance.

Scenario 4:
Regional logistics challenges increase delivery delays.

Scenario 5:
High-demand products experience stockout risk during seasonal peaks.

Scenario 6:
Slow-moving products generate excess inventory and dead stock.

--------------------------------------------------

## Analytical Outcomes

The dataset is designed to support analysis in the following areas:

- Executive Performance Monitoring
- Inventory Intelligence
- Supplier Intelligence
- Logistics Intelligence
- Warehouse Operations
- Demand Forecasting
- Predictive Analytics

The relationships between suppliers, inventory, warehouses, logistics, and customer fulfillment create actionable business insights throughout the SUPPLYSCOPE platform.

--------------------------------------------------

## Dataset Scope

Date Range:
January 2023 - December 2025

Expected Dataset Size:

- Fact_Orders: 18,000 Rows
- Fact_Inventory: 125 Rows
- Dim_Product: 25 Rows
- Dim_Supplier: 10 Rows
- Dim_Warehouse: 5 Rows
- Dim_Shipment: 18,000 Rows
- Dim_Region: 5 Rows
- Dim_Date: Approximately 1,095 Rows

--------------------------------------------------

## Success Criteria

The generated dataset should:

- Simulate realistic supply chain operations.
- Create meaningful inventory challenges.
- Generate supplier performance variations.
- Produce logistics bottlenecks and delivery delays.
- Support demand forecasting and predictive analytics.
- Enable business-driven storytelling through SUPPLYSCOPE dashboards.
- Support advanced SQL, Python, and Tableau analysis.