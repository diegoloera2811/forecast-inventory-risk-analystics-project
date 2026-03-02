# Forecast & Inventory Risk Analytics Project

## Project Overview

This project simulates a manufacturing supply chain environment and develops an end-to-end analytics solution to evaluate forecast performance and inventory risk exposure at SKU level.

The solution integrates PostgreSQL data modeling, Python-based data generation, KPI engineering, and Power BI dashboard visualization.

---

## Business Problem

Manufacturing companies often struggle with:

- Low forecast accuracy
- Excess inventory and working capital exposure
- Lack of SKU-level visibility
- Poor prioritization of high-risk products

The objective of this project is to measure forecast performance with key metrics, quantify inventory coverage (Days of Inventory), identify financially exposed SKUs and create a risk priorization framework for decision-making.

---

## Data Architecture

The project follows a layered data approach:

Raw Daily Data → Staging Tables → Fact Tables → SQL Views (Semantic Layer) → Power BI Dashboard

### Tables diagram

**Core Tables**
- `dim_product`
- `fact_sales`
- `fact_forecast`
- `fact_inventory`

```mermaid
erDiagram
  dim_product ||--o{ fact_sales : "product_id"
  dim_product ||--o{ fact_forecast : "product_id"
  dim_product ||--o{ fact_inventory : "product_id"

  dim_product {
    text product_id PK
    text product_name
    text product_family
    numeric unit_cost_mxn
  }

  fact_sales {
    date month
    text product_id FK
    int actual_units_sold
  }

  fact_forecast {
    date month
    text product_id FK
    int forecast_units
  }

  fact_inventory {
    date month
    text product_id FK
    int ending_inventory_units
  }

### Key Design Decisions

- UNIQUE constraints on (month, product_id)
- UPSERT logic for incremental data loads
- SQL views to separate transformation from visualization
- Weighted metrics to avoid small-SKU distortion

---

## KPI Engineering

### Forecast Metrics
- **MAPE (Mean Absolute Percentage Error)**
- Weighted vs non-weighted analysis

### Inventory Metrics
- **Days of Inventory (DOI)**
- **Inventory Value (MXN)**
- SKU-level exposure analysis

### Risk Score Framework
A composite risk score combining:
- Forecast inaccuracy
- Inventory coverage
- Financial exposure

---

## Analytical Insights (Sample Findings)

- Weighted forecast error: ~18%
- Top 20% of SKUs account for over 60% of inventory value exposure
- High DOI (>90 days) products represent significant working capital risk
- Certain product families exhibit systematic forecast bias

---

## Technical Stack

- PostgreSQL (Data Modeling & Transformation)
- Python (Data Simulation & Automation)
- Power BI (Visualization & KPI Dashboard)
- DAX (Metric Engineering)

---

## Key Learnings

- Separating transformation logic (SQL) from visualization improves scalability
- Weighted metrics are critical for fair cross-SKU comparison
- Incremental data loading with UPSERT ensures consistency
- Risk prioritization requires combining operational and financial metrics

---

## Future Improvements

- Introduce daily-level data modeling
- Implement rolling forecast logic
- Add supplier-level performance analysis
- Deploy to cloud-based PostgreSQL instance

---

## Dashboard Preview

*(Screenshots coming soon)*

---
