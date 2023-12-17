#docker run -d  --network host -it --rm --name runpy -v "$PWD":/src -w /src python-postgres:latest python3 test.py

docker run -d --network host -it --rm --name runpy -v "$PWD":/src -w /src python:3 sh -c "pip3 install psycopg2 &&  python test.py"

