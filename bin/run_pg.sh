 docker run --rm --network host -v $PWD/data:/var/lib/postgresql/data --name some-postgres -e 'POSTGRES_PASSWORD=123Hello$@' -d postgres:14.5
