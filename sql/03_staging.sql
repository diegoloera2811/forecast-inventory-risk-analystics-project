-- Staging tables for incremental loads

DROP TABLE IF EXISTS stg_fact_sales;
CREATE TABLE stg_fact_sales (
  month             date,
  product_id        text,
  actual_units_sold integer
);

DROP TABLE IF EXISTS stg_fact_forecast;
CREATE TABLE stg_fact_forecast (
  month          date,
  product_id     text,
  forecast_units integer
);

DROP TABLE IF EXISTS stg_fact_inventory;
CREATE TABLE stg_fact_inventory (
  month                  date,
  product_id             text,
  ending_inventory_units integer
);
