# 📘 Case Study: Forecast Accuracy & Inventory Risk Optimization

## 1️⃣ Business Context

A manufacturing company is experiencing:

- Elevated inventory levels
- Working capital pressure
- Forecast reliability concerns
- Limited SKU-level visibility

Despite having a structured forecasting process, inventory remains high.  
Leadership needs to understand whether excess inventory is caused by forecast error or by structural planning policies.

---

## 2️⃣ Objective

The objective of this project was to:

- Evaluate forecast accuracy at SKU and portfolio level
- Identify inventory risk drivers
- Quantify financial exposure
- Prioritize SKUs for action
- Build a scalable KPI architecture

---

## 3️⃣ Analytical Approach

The project was structured into five layers:

1. Data Modeling (PostgreSQL)
2. Data Validation & Incremental Loading
3. KPI Engineering (MAPE, DOI, Inventory Value)
4. Risk Segmentation Framework
5. BI Dashboard for Stakeholder Communication

Key technical elements:
- Unique constraints for idempotent loads
- UPSERT logic for monthly updates
- Weighted metrics to prevent SKU distortion
- SQL semantic layer (views) for KPI consistency

---

## 4️⃣ Key Metrics

### Forecast Accuracy (Weighted MAPE)

Weighted MAPE was used to measure portfolio-level forecast performance while preventing small-volume SKUs from distorting results.

Portfolio Weighted MAPE ranged between 10–25%, indicating moderate reliability.

---

### Days of Inventory (DOI)

DOI was calculated at SKU level to evaluate inventory coverage.

DOI range observed:
- Healthy SKUs: 30–70 days
- High-risk SKUs: >90 days

---

### Inventory Financial Exposure

Inventory Value (MXN) = Inventory Units × Unit Cost

This allowed prioritization based on financial risk instead of SKU count.

---

## 5️⃣ Findings

1. Forecast accuracy at portfolio level appeared acceptable.
2. However, SKU-level volatility was significant.
3. Overstock was not fully explained by forecast error.
4. Inventory exposure was concentrated in a small subset of SKUs.
5. Some low-MAPE SKUs still carried excessive coverage.

Conclusion:

Excess inventory is likely driven by:
- Historical overproduction
- Conservative safety stock policies
- Structural replenishment rules

Not solely by forecast inaccuracy.

---

## 6️⃣ Risk Segmentation

By combining:
- Forecast Error (MAPE)
- DOI
- Inventory Value

Four primary SKU segments were identified:

### High DOI + High Value
Working capital risk  
→ Action: Freeze replenishment / reduce safety stock

### High MAPE + High DOI
Forecast instability + overstock  
→ Action: Demand segmentation / revise planning inputs

### High MAPE + Low DOI
Volatile demand but low financial impact  
→ Action: Monitor and refine forecast model

### Low MAPE + High DOI
Stable demand but excessive coverage  
→ Action: Adjust stocking policy

---

## 7️⃣ Business Impact Simulation

If high-risk SKUs reduce coverage from 120 days to 60 days:

- Significant working capital release
- Lower storage cost
- Reduced obsolescence exposure
- Improved cash flow flexibility

Inventory optimization may unlock more financial value than marginal forecast improvements.

---

## 8️⃣ Strategic Learnings

- Portfolio averages hide SKU-level risk.
- Weighted metrics are essential in multi-SKU environments.
- Financial prioritization must complement operational KPIs.
- Clear data architecture improves analytical scalability.

---

## 9️⃣ Final Recommendation

Implement a monthly risk-based inventory review focused on:

- Top 20 SKUs by inventory value
- SKUs exceeding DOI threshold
- SKUs with rising MAPE trends

Shift from reactive inventory control to proactive risk-based prioritization.

---