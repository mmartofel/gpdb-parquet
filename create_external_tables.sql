DROP EXTERNAL TABLE pxf_hdfs_textsimple;
CREATE EXTERNAL TABLE pxf_hdfs_textsimple(location text, month text, num_orders int, total_sales float8)
             LOCATION ('pxf://data/pxf_examples/pxf_hdfs_simple.txt?PROFILE=hdfs:text')
           FORMAT 'TEXT' (delimiter=E',');

DROP EXTERNAL TABLE pxf_hdfs_writable_parquet;
CREATE WRITABLE EXTERNAL TABLE pxf_hdfs_writable_parquet (location text, month text, num_orders int, total_sales float8)
   LOCATION ('pxf://data/pxf_examples/pxf_hdfs_simple.parquet?PROFILE=hdfs:parquet')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_export');

DROP EXTERNAL TABLE pxf_hdfs_writable_text;
CREATE WRITABLE EXTERNAL TABLE pxf_hdfs_writable_text (location text, month text, num_orders int, total_sales float8)
   LOCATION ('pxf://data/pxf_examples/pxf_hdfs_simple.text?PROFILE=hdfs:text')
FORMAT 'TEXT' (delimiter=E',');

insert into pxf_hdfs_writable_parquet select * from pxf_hdfs_textsimple;
insert into pxf_hdfs_writable_text select * from pxf_hdfs_textsimple;

DROP EXTERNAL TABLE pxf_hdfs_readable_parquet;
CREATE EXTERNAL TABLE pxf_hdfs_readable_parquet (location text, month text, num_orders int, total_sales float8)
   LOCATION ('pxf://data/pxf_examples/pxf_hdfs_simple.parquet?PROFILE=hdfs:parquet')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

DROP EXTERNAL TABLE pxf_hdfs_readable_text;
CREATE EXTERNAL TABLE pxf_hdfs_readable_text (location text, month text, num_orders int, total_sales float8)
   LOCATION ('pxf://data/pxf_examples/pxf_hdfs_simple.text?PROFILE=hdfs:text')
FORMAT 'TEXT' (delimiter=E',');

SELECT * FROM pxf_hdfs_readable_parquet;
SELECT * FROM pxf_hdfs_readable_text;
