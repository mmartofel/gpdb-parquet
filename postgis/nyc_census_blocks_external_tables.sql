
DROP EXTERNAL TABLE public.nyc_census_blocks_bronx_writable_parquet;

CREATE WRITABLE EXTERNAL TABLE public.nyc_census_blocks_bronx_writable_parquet
(
 gid        integer,
 blkid      character,
 popn_total double precision,
 popn_white double precision,
 popn_black double precision,
 popn_nativ double precision,
 popn_asian double precision,
 popn_other double precision,
 boroname   character varying(32),
 geom       geometry(MultiPolygon,26918)
)
   LOCATION ('pxf://data/nyc_census_blocks/nyc_census_blocks_bronx.parquet?PROFILE=hdfs:parquet')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_export');
