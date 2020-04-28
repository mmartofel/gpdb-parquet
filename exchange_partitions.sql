-- Run partition exchange followed by partition table rename:
-- psql -v p1=2 -f exchange_partitions.sql

ALTER TABLE tpcds.catalog_sales_hybrid EXCHANGE PARTITION FOR (RANK(1)) WITH TABLE tpcds.catalog_sales_parquet_readable_ext_:p1 WITHOUT VALIDATION;
ALTER TABLE tpcds.catalog_sales_hybrid RENAME PARTITION FOR(RANK(1)) to _ext_parquet;
