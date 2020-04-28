ALTER TABLE tpcds.catalog_sales_hybrid EXCHANGE PARTITION FOR (RANK(1)) WITH TABLE tpcds.catalog_sales_parquet_readable_ext_2 WITHOUT VALIDATION;
ALTER TABLE catalog_sales_hybrid RENAME PARTITION FOR(RANK(1)) to "catalog_sales_hybrid_1_prt_2_ext_parquet";
