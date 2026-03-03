-- Insight queries for storytelling

-- Global Weighted MAPE
SELECT
  SUM(abs_error)::numeric / NULLIF(SUM(actual_units_sold), 0) AS weighted_mape
FROM v_metrics;

-- Top risk SKUs by inventory value in last month
SELECT
  month,
  product_name,
  product_family,
  SUM(inventory_value_mxn) AS total_inventory_value_mxn
FROM v_metrics
WHERE month = (SELECT MAX(month) FROM v_metrics)
GROUP BY 1,2,3
ORDER BY total_inventory_value_mxn DESC
LIMIT 10;

-- Average DOI by product family
SELECT
  product_family,
  AVG(doi_days) AS avg_doi_days
FROM v_metrics
GROUP BY 1
ORDER BY avg_doi_days DESC;

-- Worst MAPE SKUs (simple avg APE)
SELECT
  product_name,
  AVG(ape) AS avg_mape
FROM v_metrics
GROUP BY 1
ORDER BY avg_mape DESC
LIMIT 10;
