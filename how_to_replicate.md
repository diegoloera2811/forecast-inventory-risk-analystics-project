# How to Run This Project

This guide explains how to reproduce the full Forecast & Inventory Risk Analytics project using PostgreSQL and Power BI.

---

## 1. Requirements

- PostgreSQL 14+ (or newer)
- pgAdmin (or any SQL client)
- Power BI Desktop
- Python (optional, for data generation)

---

## 2. Create the Database

Open pgAdmin and create a new database and name it as follows:
'forecast_project'

---

## 3. Run SQL Scripts (in order)

Navigate to the `/sql` folder and execute scripts in this order:

1. `01_schema.sql`
2. `02_constraints.sql`
3. `03_staging.sql`

At this point, tables and constraints should be created.

---

## 4. Load Data

There are two options:

### Option A – Load sample CSV files manually (for same results)

1. Right-click on `stg_fact_sales`
2. Select **Import/Export Data**
3. Import the corresponding CSV file
4. Repeat for:
   - `stg_fact_forecast`
   - `stg_fact_inventory`

Then run the script: '04_upsert_pipeline.sql'

---

### Option B – Generate Data with Python (random results)

Run the notebooks inside the `/data` folder to generate:

- `dim_product.csv`
- `fact_sales.csv`
- `fact_forecast.csv`
- `fact_inventory.csv`

Import them into staging tables and execute the upsert script.

---

## 5. Create Semantic Layer

Run the script: '05_views.sql'

This will create:

- `v_master`
- `v_metrics`

These views centralize metric logic and should be used as the data source for BI tools.

---

## 6. Run Analytical Queries

Execute: '06_analysis_queries.sql'

These queries generate:

- Weighted MAPE
- Top risk SKUs
- Inventory exposure by family
- DOI analysis

---

## 7. Connect to Power BI

1. Open Power BI Desktop
2. Click **Get Data → PostgreSQL**
3. Enter:
   - Server: `localhost`
   - Database: `forecast_project`
4. Select view:
   - `v_metrics`

All KPI logic is already defined in SQL.

---

## 8. Reproducing Incremental Loads

To simulate monthly updates:

1. Import new data into staging tables
2. Run '04_upsert_pipeline.sql'
3. Views automatically reflect updates

---

## Notes

- All metrics are calculated at SKU level.
- Weighted metrics are used to avoid small-SKU distortion.
- Unique constraints ensure idempotent incremental loads.
