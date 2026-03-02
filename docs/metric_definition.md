# 📊 Metric Definitions

This document defines all KPIs used in the **Forecast & Inventory Risk Analytics Project**.

**Granularity:** Monthly, SKU-level (`month`, `product_id`)

---

# 1️⃣ Forecast Accuracy Metrics

## 1.1 Absolute Error

**Definition:**  
Difference between actual and forecast demand.

$$
Absolute\ Error = | Actual - Forecast |
$$

**Business Meaning:**  
Measures magnitude of forecast deviation in units.

---

## 1.2 MAPE (Mean Absolute Percentage Error)

$$
MAPE = \frac{|Actual - Forecast|}{Actual}
$$

**Weighted Portfolio MAPE:**

$$
Weighted\ MAPE = \frac{\sum |Actual - Forecast|}{\sum Actual}
$$

**Why Weighted?**  
Prevents low-volume SKUs from distorting portfolio accuracy.

**Interpretation:**
- < 20% → Strong forecast reliability  
- 20–35% → Moderate performance  
- > 35% → Forecast instability  

---

## 1.3 Forecast Accuracy

$$
Forecast\ Accuracy = 1 - Weighted\ MAPE
$$

Example:  
If Weighted MAPE = 0.18 → Forecast Accuracy = 82%

---

## 1.4 MAE (Mean Absolute Error)

$$
MAE = \frac{1}{n} \sum |Actual - Forecast|
$$

**Interpretation:**  
Measures forecast deviation in units rather than percentage.

---

# 2️⃣ Inventory Metrics

## 2.1 Inventory Value (MXN)

$$
Inventory\ Value = Inventory\ Units \times Unit\ Cost
$$

Represents working capital exposure.

---

## 2.2 Days of Inventory (DOI)

$$
DOI = \left( \frac{Inventory\ Units}{Actual\ Demand} \right) \times 30
$$

**Interpretation:**
- < 30 days → Stockout risk  
- 30–70 days → Healthy coverage  
- > 90 days → Overstock risk  

---

## 2.3 Weighted DOI (Portfolio Level)

$$
Weighted\ DOI = \frac{\sum (DOI \times Inventory\ Value)}{\sum Inventory\ Value}
$$

Weights coverage by financial exposure.

---

# 3️⃣ Risk Framework

## 3.1 Composite Risk Score (Conceptual)

$$
Risk\ Score = f(MAPE, DOI, Inventory\ Value)
$$

This score prioritizes SKUs based on:
- Forecast instability  
- Coverage excess  
- Financial impact  

It is designed for **decision prioritization**, not prediction.

---

# 4️⃣ Aggregation Rules

Base grain: SKU-Month  

Portfolio level:
- Inventory Value → SUM  
- DOI → Weighted Average  
- Forecast Accuracy → Weighted MAPE  

---

# 5️⃣ Design Principles

- Use weighted metrics to avoid distortion  
- Combine operational + financial KPIs  
- Keep metric logic centralized in SQL  
- Use BI layer for visualization only  

---
