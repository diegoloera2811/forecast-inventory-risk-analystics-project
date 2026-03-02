# Data Dictionary

This data dictionary describes the tables and fields used in the Forecast & Inventory Risk Analytics Project.

---

## Table: `dim_product`

**Purpose:** Product master data used to enrich fact tables with descriptive attributes and cost.

| Column | Type | Key | Nullable | Description | Example |
|---|---|---|---|---|---|
| product_id | text | PK | No | Unique SKU identifier | P001 |
| product_name | text |  | No | Human-readable product name | Part_P001 |
| product_family | text |  | No | Product category/family for aggregation | Electrical |
| unit_cost_mxn | numeric(12,2) |  | No | Unit cost in MXN used to value inventory | 131.82 |

---

## Table: `fact_sales`

**Purpose:** Monthly actual demand/sales by SKU.

| Column | Type | Key | Nullable | Description | Example |
|---|---|---|---|---|---|
| month | date | UK* | No | Month start date (always YYYY-MM-01) | 2026-01-01 |
| product_id | text | FK, UK* | No | SKU identifier linked to `dim_product` | P001 |
| actual_units_sold | integer |  | No | Actual units sold in the month | 2121 |

**Notes:**
- *UK = Unique Key: (`month`, `product_id`)
- Units are non-negative (>= 0)

---

## Table: `fact_forecast`

**Purpose:** Monthly forecast quantity by SKU.

| Column | Type | Key | Nullable | Description | Example |
|---|---|---|---|---|---|
| month | date | UK* | No | Month start date (always YYYY-MM-01) | 2026-01-01 |
| product_id | text | FK, UK* | No | SKU identifier linked to `dim_product` | P001 |
| forecast_units | integer |  | No | Forecasted units for the month | 1980 |

**Notes:**
- *UK = Unique Key: (`month`, `product_id`)
- Units are non-negative (>= 0)

---

## Table: `fact_inventory`

**Purpose:** Month-end on-hand inventory by SKU.

| Column | Type | Key | Nullable | Description | Example |
|---|---|---|---|---|---|
| month | date | UK* | No | Month start date (always YYYY-MM-01) | 2026-01-01 |
| product_id | text | FK, UK* | No | SKU identifier linked to `dim_product` | P001 |
| ending_inventory_units | integer |  | No | Ending inventory units (snapshot at month end) | 5400 |

**Notes:**
- *UK = Unique Key: (`month`, `product_id`)
- Units are non-negative (>= 0)

---

## View: `v_master`

**Purpose:** One consolidated dataset for analysis by joining sales, forecast, inventory, and product attributes.

| Column | Description |
|---|---|
| month | Month start date |
| product_id | SKU identifier |
| product_name | Product name |
| product_family | Family/category |
| unit_cost_mxn | Unit cost (MXN) |
| actual_units_sold | Actual units sold |
| forecast_units | Forecast units |
| ending_inventory_units | Ending inventory units |
| inventory_value_mxn | `ending_inventory_units * unit_cost_mxn` |

---

## View: `v_metrics`

**Purpose:** Metric layer with reusable KPI fields for BI tools.

| Column | Description |
|---|---|
| abs_error | `ABS(actual_units_sold - forecast_units)` |
| ape | Absolute percentage error (`abs_error / actual_units_sold`) when actual > 0 |
| doi_days | Days of inventory (`ending_inventory_units / actual_units_sold * 30`) when actual > 0 |

---

## Staging Tables (ETL)

**Purpose:** Temporary landing tables used to load monthly updates before merging into fact tables via UPSERT.

- `stg_fact_sales`
- `stg_fact_forecast`
- `stg_fact_inventory`

These staging tables support idempotent loads (safe to re-run without duplicating records).
