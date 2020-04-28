-- Insert data into EXTERNAL WRITABLE table responsible to hold data to given partition
-- use command:
-- psql -v p1=2 -f insert_catalog_sales_parquet_writable_ext_partition.sql

insert into tpcds.catalog_sales_parquet_writable_ext_:p1
select * from tpcds.catalog_sales
where cs_sold_date_sk between (2450815 + ((:p1-2)*28)) and (2450815 + ((:p1-1)*28))

-- START (2450815) END (2450843)
