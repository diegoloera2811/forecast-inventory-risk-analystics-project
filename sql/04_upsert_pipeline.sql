-- UPSERT from staging to fact tables

-- SALES
INSERT INTO fact_sales (month, product_id, actual_units_sold)
SELECT month, product_id, actual_units_sold
FROM stg_fact_sales
ON CONFLICT (month, product_id)
DO UPDATE SET actual_units_sold = EXCLUDED.actual_units_sold;

-- FORECAST
INSERT INTO fact_forecast (month, product_id, forecast_units)
SELECT month, product_id, forecast_units
FROM stg_fact_forecast
ON CONFLICT (month, product_id)
DO UPDATE SET forecast_units = EXCLUDED.forecast_units;

-- INVENTORY
INSERT INTO fact_inventory (month, product_id, ending_inventory_units)
SELECT month, product_id, ending_inventory_units
FROM stg_fact_inventory
ON CONFLICT (month, product_id)
DO UPDATE SET ending_inventory_units = EXCLUDED.ending_inventory_units;

-- Cleanup staging
TRUNCATE stg_fact_sales;
TRUNCATE stg_fact_forecast;
TRUNCATE stg_fact_inventory;
