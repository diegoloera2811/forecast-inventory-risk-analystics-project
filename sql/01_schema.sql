-- Core tables for Forecast & Inventory Risk Analytics Project

CREATE TABLE IF NOT EXISTS dim_product (
  product_id        text PRIMARY KEY,
  product_name      text NOT NULL,
  product_family    text NOT NULL,
  unit_cost_mxn     numeric(12,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS fact_sales (
  month             date NOT NULL,
  product_id        text NOT NULL,
  actual_units_sold integer NOT NULL CHECK (actual_units_sold >= 0)
);

CREATE TABLE IF NOT EXISTS fact_forecast (
  month             date NOT NULL,
  product_id        text NOT NULL,
  forecast_units    integer NOT NULL CHECK (forecast_units >= 0)
);

CREATE TABLE IF NOT EXISTS fact_inventory (
  month                   date NOT NULL,
  product_id              text NOT NULL,
  ending_inventory_units  integer NOT NULL CHECK (ending_inventory_units >= 0)
);
