-- Run partition exchange followed by partition table rename:
-- psql -f exchange_partitions.sql

ALTER TABLE tpcds.catalog_sales_hybrid EXCHANGE PARTITION FOR (RANK(1)) WITH TABLE tpcds.catalog_sales_parquet_readable_ext_2 WITHOUT VALIDATION;
ALTER TABLE tpcds.catalog_sales_hybrid RENAME PARTITION FOR(RANK(1)) to _ext_parquet;
