 docker run -d  -eDB_PASS --network host -it --rm --name runpy -v "$PWD/../src":/src -w /src python-postgres:latest python3 /src/test.py
