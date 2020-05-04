
DROP EXTERNAL TABLE public.nyc_census_blocks_bronx_writable_parquet;

CREATE WRITABLE EXTERNAL TABLE public.nyc_census_blocks_bronx_writable_parquet
(
 gid        integer,
 blkid      character varying(15),
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

insert into public.nyc_census_blocks_bronx_writable_parquet select * from public.nyc_census_blocks where boroname='The Bronx';

DROP EXTERNAL TABLE public.nyc_census_blocks_bronx_readable_parquet;

CREATE EXTERNAL TABLE public.nyc_census_blocks_bronx_readable_parquet
(
 gid        integer,
 blkid      character varying(15),
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
FORMAT 'CUSTOM' (FORMATTER='pxfreadable_export');

SELECT count(*) from public.nyc_census_blocks_bronx_readable_parquet;
