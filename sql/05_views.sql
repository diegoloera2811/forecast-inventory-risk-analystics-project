-- Semantic layer for BI consumption

CREATE OR REPLACE VIEW v_master AS
SELECT
  s.month,
  s.product_id,
  p.product_name,
  p.product_family,
  p.unit_cost_mxn,
  s.actual_units_sold,
  f.forecast_units,
  i.ending_inventory_units,
  (i.ending_inventory_units * p.unit_cost_mxn) AS inventory_value_mxn
FROM fact_sales s
JOIN dim_product p
  ON s.product_id = p.product_id
LEFT JOIN fact_forecast f
  ON s.month = f.month AND s.product_id = f.product_id
LEFT JOIN fact_inventory i
  ON s.month = i.month AND s.product_id = i.product_id;

CREATE OR REPLACE VIEW v_metrics AS
SELECT
  *,
  ABS(actual_units_sold - forecast_units) AS abs_error,
  CASE
    WHEN actual_units_sold = 0 THEN NULL
    ELSE ABS(actual_units_sold - forecast_units)::numeric / actual_units_sold
  END AS ape, -- for MAPE
  CASE
    WHEN actual_units_sold = 0 THEN NULL
    ELSE (ending_inventory_units::numeric / actual_units_sold) * 30
  END AS doi_days
FROM v_master;
