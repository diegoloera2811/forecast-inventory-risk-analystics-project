-- Keys, constraints, and relationships

-- Unique constraints (required for UPSERT)
ALTER TABLE fact_sales
  ADD CONSTRAINT IF NOT EXISTS uq_fact_sales UNIQUE (month, product_id);

ALTER TABLE fact_forecast
  ADD CONSTRAINT IF NOT EXISTS uq_fact_forecast UNIQUE (month, product_id);

ALTER TABLE fact_inventory
  ADD CONSTRAINT IF NOT EXISTS uq_fact_inventory UNIQUE (month, product_id);

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

-- Helpful indexes for performance
CREATE INDEX IF NOT EXISTS idx_sales_month ON fact_sales(month);
CREATE INDEX IF NOT EXISTS idx_forecast_month ON fact_forecast(month);
CREATE INDEX IF NOT EXISTS idx_inventory_month ON fact_inventory(month);
