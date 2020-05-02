DBNAME=nyc

createdb $DBNAME

psql -d $DBNAME -f /usr/local/greenplum-db/share/postgresql/contrib/postgis-2.1/install/spatial_ref_sys.sql
psql -d $DBNAME -f /usr/local/greenplum-db/share/postgresql/contrib/postgis-2.1/install/postgis.sql
psql -d $DBNAME -f /usr/local/greenplum-db/share/postgresql/contrib/postgis-2.1/install/rtpostgis.sql
psql -d $DBNAME -f /usr/local/greenplum-db/share/postgresql/contrib/postgis-2.1/install/postgis_comments.sql
psql -d $DBNAME -f /usr/local/greenplum-db/share/postgresql/contrib/postgis-2.1/install/raster_comments.sql
psql -d $DBNAME -f /usr/local/greenplum-db/share/postgresql/contrib/postgis-2.1/install/topology_comments.sql
