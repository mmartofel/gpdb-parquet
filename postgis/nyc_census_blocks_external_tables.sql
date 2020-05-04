
DROP EXTERNAL TABLE nyc_census_blocks_bronx_writable_parquet;

CREATE WRITABLE EXTERNAL TABLE nyc_census_blocks_bronx_writable_parquet like nyc_census_blocks
   LOCATION ('pxf://data/nyc_census_blocks/nyc_census_blocks_bronx.parquet?PROFILE=hdfs:parquet')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_export');
