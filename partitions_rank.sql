SELECT schemaname, tablename, partitiontablename, partitionrank
FROM   pg_partitions
WHERE  tablename='catalog_sales_hybrid'
ORDER BY 4;
