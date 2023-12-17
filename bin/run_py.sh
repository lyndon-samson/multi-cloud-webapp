 docker run -d  --network host -it --rm --name runpy -v "$PWD":/src -w /src python-postgres:latest python3 test.py
