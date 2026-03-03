-- Keys, constraints, and relationships

-- Unique constraints (required for UPSERT)
CREATE UNIQUE INDEX IF NOT EXISTS uq_fact_sales_month_product
  ON fact_sales (month, product_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_fact_forecast_month_product
  ON fact_forecast (month, product_id);

CREATE UNIQUE INDEX IF NOT EXISTS uq_fact_inventory_month_product
  ON fact_inventory (month, product_id);

-- Foreign keys to dim_product
ALTER TABLE fact_sales
  ADD CONSTRAINT IF NOT EXISTS fk_sales_product
  FOREIGN KEY (product_id) REFERENCES dim_product(product_id);

ALTER TABLE fact_forecast
  ADD CONSTRAINT IF NOT EXISTS fk_forecast_product
  FOREIGN KEY (product_id) REFERENCES dim_product(product_id);

ALTER TABLE fact_inventory
  ADD CONSTRAINT IF NOT EXISTS fk_inventory_product
  FOREIGN KEY (product_id) REFERENCES dim_product(product_id);