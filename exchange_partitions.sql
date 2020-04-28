-- Run partition exchange followed by partition table rename:
-- psql -f exchange_partitions.sql

ALTER TABLE tpcds.catalog_sales_hybrid EXCHANGE PARTITION FOR (RANK(1)) WITH TABLE tpcds.catalog_sales_parquet_readable_ext_2 WITHOUT VALIDATION;
ALTER TABLE tpcds.catalog_sales_hybrid RENAME PARTITION FOR(RANK(1)) to _2_ext_parquet;

ALTER TABLE tpcds.catalog_sales_hybrid EXCHANGE PARTITION FOR (RANK(2)) WITH TABLE tpcds.catalog_sales_parquet_readable_ext_3 WITHOUT VALIDATION;
ALTER TABLE tpcds.catalog_sales_hybrid RENAME PARTITION FOR(RANK(2)) to _3_ext_parquet;

ALTER TABLE tpcds.catalog_sales_hybrid EXCHANGE PARTITION FOR (RANK(3)) WITH TABLE tpcds.catalog_sales_parquet_readable_ext_4 WITHOUT VALIDATION;
ALTER TABLE tpcds.catalog_sales_hybrid RENAME PARTITION FOR(RANK(3)) to _4_ext_parquet;

ALTER TABLE tpcds.catalog_sales_hybrid EXCHANGE PARTITION FOR (RANK(4)) WITH TABLE tpcds.catalog_sales_parquet_readable_ext_5 WITHOUT VALIDATION;
ALTER TABLE tpcds.catalog_sales_hybrid RENAME PARTITION FOR(RANK(4)) to _5_ext_parquet;

ALTER TABLE tpcds.catalog_sales_hybrid EXCHANGE PARTITION FOR (RANK(5)) WITH TABLE tpcds.catalog_sales_parquet_readable_ext_6 WITHOUT VALIDATION;
ALTER TABLE tpcds.catalog_sales_hybrid RENAME PARTITION FOR(RANK(5)) to _6_ext_parquet;

ALTER TABLE tpcds.catalog_sales_hybrid EXCHANGE PARTITION FOR (RANK(6)) WITH TABLE tpcds.catalog_sales_parquet_readable_ext_7 WITHOUT VALIDATION;
ALTER TABLE tpcds.catalog_sales_hybrid RENAME PARTITION FOR(RANK(6)) to _7_ext_parquet;

ALTER TABLE tpcds.catalog_sales_hybrid EXCHANGE PARTITION FOR (RANK(7)) WITH TABLE tpcds.catalog_sales_parquet_readable_ext_8 WITHOUT VALIDATION;
ALTER TABLE tpcds.catalog_sales_hybrid RENAME PARTITION FOR(RANK(7)) to _8_ext_parquet;

ALTER TABLE tpcds.catalog_sales_hybrid EXCHANGE PARTITION FOR (RANK(8)) WITH TABLE tpcds.catalog_sales_parquet_readable_ext_9 WITHOUT VALIDATION;
ALTER TABLE tpcds.catalog_sales_hybrid RENAME PARTITION FOR(RANK(8)) to _9_ext_parquet;

ALTER TABLE tpcds.catalog_sales_hybrid EXCHANGE PARTITION FOR (RANK(9)) WITH TABLE tpcds.catalog_sales_parquet_readable_ext_10 WITHOUT VALIDATION;
ALTER TABLE tpcds.catalog_sales_hybrid RENAME PARTITION FOR(RANK(9)) to _10_ext_parquet;

ALTER TABLE tpcds.catalog_sales_hybrid EXCHANGE PARTITION FOR (RANK(10)) WITH TABLE tpcds.catalog_sales_parquet_readable_ext_11 WITHOUT VALIDATION;
ALTER TABLE tpcds.catalog_sales_hybrid RENAME PARTITION FOR(RANK(10)) to _11_ext_parquet;
