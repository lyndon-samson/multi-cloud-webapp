DATA_DIR=/home/admin/data
docker run --rm --network host -v $DATA_DIR:/var/lib/postgresql/data --name postgres -e 'POSTGRES_PASSWORD' -d postgres:14.5
