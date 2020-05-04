DROP TABLE public.nyc_census_blocks_partitioned;
BEGIN;
CREATE TABLE public.nyc_census_blocks_partitioned (
gid serial,
blkid varchar(15),
popn_total float8,
popn_white float8,
popn_black float8,
popn_nativ float8,
popn_asian float8,
popn_other float8,
boroname varchar(32))
DISTRIBUTED BY (gid)
PARTITION BY LIST (boroname)
( PARTITION bronx VALUES ('Bronx'),
  PARTITION queens VALUES ('Queens'),
  PARTITION manhattan VALUES ('Manhattan'),
  PARTITION brooklyn VALUES ('Brooklyn'),
  PARTITION staten_sland VALUES ('Staten Island'),
  DEFAULT PARTITION other );

ALTER TABLE public.nyc_census_blocks_partitioned ADD PRIMARY KEY (gid);

SELECT AddGeometryColumn('public','nyc_census_blocks_partitioned','geom','26918','MULTIPOLYGON',2);
