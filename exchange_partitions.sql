-- Run partition exchange followed by partition table rename:
-- psql -v p1=2 -f exchange_partitions.sql

DO $$
DECLARE rank int;
BEGIN
rank = :p1 - 1;
ALTER TABLE tpcds.catalog_sales_hybrid EXCHANGE PARTITION FOR (RANK(rank)) WITH TABLE tpcds.catalog_sales_parquet_readable_ext_:p1 WITHOUT VALIDATION;
ALTER TABLE tpcds.catalog_sales_hybrid RENAME PARTITION FOR(RANK(rank)) to _ext_parquet;
END $$;
