# 📊 Forecast & Inventory Risk Analytics

End-to-end Supply Chain Analytics project focused on forecast accuracy, inventory exposure, and financial risk prioritization.

---

## 🎯 Project Objective

Evaluate whether excess inventory is driven by forecast inaccuracy or by structural planning policies.

The project integrates:

- Forecast performance analysis
- Inventory coverage evaluation
- Financial exposure quantification
- Risk-based SKU prioritization

---

## 🛠️ Tech Stack

- PostgreSQL (Data modeling & semantic layer)
- Python (Dataset generation & simulation)
- Power BI (Dashboard & storytelling)
- SQL (Metric engineering & aggregation logic)

---

## 🏗️ Architecture Overview

Raw Data → Staging → Fact Tables → SQL Views → Power BI

- Idempotent monthly updates (UPSERT)
- Centralized KPI definitions
- Weighted portfolio metrics
- Financial prioritization framework

---

## 📈 Key Metrics

- Weighted MAPE (Portfolio Forecast Accuracy)
- MAE (Unit-level deviation)
- Days of Inventory (DOI)
- Inventory Financial Exposure (MXN)
- Composite Risk Segmentation

---

## 🔍 Key Insights

- Portfolio forecast accuracy was within acceptable range.
- SKU-level volatility remained significant.
- Overstock was not solely caused by forecast error.
- Financial exposure was concentrated in a limited SKU subset.
- Inventory optimization offers greater impact than marginal forecast improvements.

---

## 📷 Dashboard Preview

![Dashboard](images/dashboard_page1.png)

---

## 📘 Documentation

- Business Narrative → `/docs/case_study.md`
- Technical Details → `/docs/technical_documentation.md`
- SQL Pipeline → `/sql/`
- Reproducible Dataset → `/data/`

---

## 🚀 Future Enhancements

- Weekly granularity
- Lead-time variability modeling
- Automated threshold alerts
- Cloud database deployment