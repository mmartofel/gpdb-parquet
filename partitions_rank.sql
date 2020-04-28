SELECT schemaname, tablename, partitiontablename, partitionrank
FROM   pg_partitions
WHERE  tablename='catalog_sales_hybrid' and schemaname='tpcds'
ORDER BY 4;
