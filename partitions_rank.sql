SELECT partitiontablename, partitionrank
FROM   pg_partitions
WHERE  partitiontablename like 'catalog_sales_hybrid%';
