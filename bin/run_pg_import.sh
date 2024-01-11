DATA_SQL_DIR=/home/admin/multi-cloud-webapp/data
DATA_SQL_DIR=/home/samsonl/multi-cloud-webapp/data
DATA_SQL_DIR=$HOME/multi-cloud-webapp/data
docker run -it -v$DATA_SQL_DIR:/data  --rm --network host postgres:14.5 psql -h localhost -U postgres -f /data/quotes.sql
