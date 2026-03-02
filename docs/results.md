# 📈 Analytical Results

This document summarizes the key findings derived from the Forecast & Inventory Risk Analytics Project.

---

# 1️⃣ Executive Summary

The analysis reveals that forecast accuracy alone does not fully explain inventory exposure.

While global weighted forecast error remains within an acceptable range, several SKUs show structural overstock driven by coverage policies and historical accumulation rather than current forecast instability.

Inventory risk is concentrated in a limited subset of high-value SKUs.

---

# 2️⃣ Forecast Performance

## Portfolio-Level Accuracy

- Weighted MAPE: ~18–25%
- Forecast Accuracy: ~75–82%

Interpretation:
The forecasting process is moderately reliable at portfolio level.

However, SKU-level analysis reveals high dispersion:
- Some SKUs exceed 50% MAPE
- Others remain below 15%

Conclusion:
Portfolio averages mask SKU-level volatility.

---

# 3️⃣ Inventory Exposure

## Inventory Value Concentration

A small percentage of SKUs represent a disproportionate share of total inventory value (Pareto effect).

Business Implication:
Risk management must prioritize financial exposure rather than SKU count.

---

## Days of Inventory (DOI)

Observed patterns:
- Several SKUs exceed 90–120 days of coverage
- High DOI does not always correlate with high forecast error

Conclusion:
Overstock is not purely a forecasting issue.
It may stem from:
- Safety stock policies
- Lead-time buffers
- Historical overproduction

---

# 4️⃣ Risk Segmentation

By combining:
- MAPE
- DOI
- Inventory Value

Four major SKU clusters emerge:

### 1. High DOI + High Value
→ Working capital risk  
Action: Freeze replenishment / review stocking policy

### 2. High MAPE + High DOI
→ Forecast instability + overstock  
Action: Segment demand / revise forecast drivers

### 3. High MAPE + Low DOI
→ Volatile demand but low financial exposure  
Action: Monitor / refine forecasting model

### 4. Low MAPE + High DOI
→ Stable demand but excess coverage  
Action: Adjust safety stock policy

---

# 5️⃣ Business Impact Simulation

If high-risk SKUs reduce coverage from 120 days to 60 days:

- Significant working capital release
- Reduced storage cost
- Lower obsolescence risk
- Improved cash flow flexibility

Strategic takeaway:
Inventory optimization can unlock more value than marginal forecast improvements.

---

# 6️⃣ Strategic Insights

1. Weighted metrics are essential for portfolio-level clarity.
2. Financial prioritization must complement operational KPIs.
3. Forecast accuracy does not automatically guarantee healthy inventory.
4. Data architecture separation improves analytical scalability.

---

# 7️⃣ Final Recommendation

Implement a monthly risk review dashboard focusing on:

- Top 20 SKUs by inventory value
- SKUs with DOI > threshold
- SKUs with rising MAPE trend

Shift from reactive inventory management to risk-based prioritization.

---
