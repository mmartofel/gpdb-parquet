DBNAME=nyc

# Recreate database
dropdb $DBNAME
createdb $DBNAME

# Enable PostGIS at the database
psql -d $DBNAME -f /usr/local/greenplum-db/share/postgresql/contrib/postgis-2.1/install/postgis.sql
psql -d $DBNAME -f /usr/local/greenplum-db/share/postgresql/contrib/postgis-2.1/install/spatial_ref_sys.sql
psql -d $DBNAME -f /usr/local/greenplum-db/share/postgresql/contrib/postgis-2.1/install/rtpostgis.sql
psql -d $DBNAME -f /usr/local/greenplum-db/share/postgresql/contrib/postgis-2.1/install/postgis_comments.sql
psql -d $DBNAME -f /usr/local/greenplum-db/share/postgresql/contrib/postgis-2.1/install/raster_comments.sql
psql -d $DBNAME -f /usr/local/greenplum-db/share/postgresql/contrib/postgis-2.1/install/topology_comments.sql

# Load data
psql -d $DBNAME -f ./nyc_census_blocks.sql
psql -d $DBNAME -f ./nyc_census_sociodata.sql
psql -d $DBNAME -f ./nyc_neighborhoods.sql
psql -d $DBNAME -f ./nyc_streets.sql
psql -d $DBNAME -f ./nyc_subway_stations.sql

# Create partitioned and hybrid (consisting external patitions) tables
psql -d $DBNAME -f ./nyc_census_blocks_partitioned.sql
psql -d $DBNAME -f ./nyc_census_blocks_hybrid.sql
