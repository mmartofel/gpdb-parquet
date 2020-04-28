echo "Recreate CATALOG_SALES_HYBRID table at TPCDS schem""
psql < catalog_sales_hybrid.sql

echo "Create readable and writable external table to store PARQUET data"
./create_external_tables_catalog_sales.sh

echo "Delete old files from HDFS directory /data/catalog_sales.parquet if they exist"
ssh cluster-verint-m hdfs dfs -rm -r /data/catalog_sales.parquet

echo "Unload data to HDFS writing to EXTERNAL WRITABLE tables"
./insert_catalog_sales_parquet_writable_ext_partition.sh

echo "Exchange oldest 10 partitions at CATALOG_SALES_HYBRID table with external tables"
./exchange_partitions.sh

echo "Check exchanged partitions"
psql < partitions_rank.sql

