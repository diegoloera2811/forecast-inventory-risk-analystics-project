# Metric Definitions

This document defines all key performance indicators (KPIs) used in the Forecast & Inventory Risk Analytics Project.

Granularity: Monthly, SKU-level (month, product_id) unless otherwise specified.

------------------------------------------------------------

1) Forecast Accuracy Metrics

1.1 Absolute Error

Definition:
Absolute difference between actual demand and forecast demand.

Formula:
ABS(actual_units_sold - forecast_units)

Business interpretation:
Measures how far the forecast was from reality in units, regardless of direction.

------------------------------------------------------------

1.2 MAPE (Mean Absolute Percentage Error)

Definition:
Absolute percentage deviation between actual and forecast demand.

Formula:
ABS(actual_units_sold - forecast_units) / actual_units_sold

Global Weighted MAPE formula:
SUM(ABS(actual_units_sold - forecast_units)) 
/ SUM(actual_units_sold)

Business interpretation:
Low MAPE → forecast is stable and reliable.
High MAPE → demand volatility or poor forecasting inputs.

Limitations:
- Undefined when actual_units_sold = 0.
- Can be inflated for low-volume SKUs.

------------------------------------------------------------

1.3 Forecast Accuracy (%)

Definition:
Accuracy derived from Weighted MAPE.

Formula:
Forecast Accuracy = 1 - Weighted MAPE

Example:
If Weighted MAPE = 0.18 → Forecast Accuracy ≈ 82%

------------------------------------------------------------

1.4 MAE (Mean Absolute Error)

Definition:
Average absolute forecast error in units.

Formula:
AVG(ABS(actual_units_sold - forecast_units))

Business interpretation:
Represents the typical deviation in units.
Useful for operational production planning.

------------------------------------------------------------

2) Inventory Metrics

2.1 Ending Inventory Units

Definition:
Units available at the end of the month.

Source:
fact_inventory.ending_inventory_units

------------------------------------------------------------

2.2 Inventory Value (MXN)

Definition:
Financial exposure tied to inventory.

Formula:
ending_inventory_units * unit_cost_mxn

Business interpretation:
Measures working capital tied up in stock.

------------------------------------------------------------

2.3 Days of Inventory (DOI)

Definition:
Estimated number of days inventory can cover demand.

Formula:
(ending_inventory_units / actual_units_sold) * 30

Business interpretation:
< 30 days → potential stockout risk
30–70 days → healthy coverage
> 90 days → overstock risk

Limitation:
Assumes relatively stable demand.

------------------------------------------------------------

2.4 Weighted DOI (Portfolio Level)

Definition:
Portfolio-level DOI weighted by financial exposure.

Conceptual Formula:
SUM(DOI * Inventory Value) / SUM(Inventory Value)

Business interpretation:
Represents the real inventory coverage considering cost exposure.

------------------------------------------------------------

3) Risk Framework

3.1 Composite Risk Score

Definition:
A prioritization metric combining operational and financial risk.

Inputs:
- Forecast Error (MAPE or Abs Error)
- DOI
- Inventory Value

Purpose:
Identify SKUs requiring immediate review.

Example decision logic:
High DOI + High Inventory Value → Overstock risk
High MAPE + High DOI → Forecast and policy issue
High MAPE + Low DOI → Volatility but low financial exposure

------------------------------------------------------------

4) Aggregation Rules

Base granularity:
month + product_id

Product Family level:
Inventory Value → SUM
DOI → AVG or Weighted DOI
Forecast Accuracy → Weighted MAPE preferred

------------------------------------------------------------

5) Design Principles

- Weighted metrics prevent small-SKU distortion.
- Financial prioritization is critical.
- KPI logic should live in SQL (semantic layer).
- BI layer consumes clean views only.

------------------------------------------------------------
