s
import psycopg2
import json
from functools import cached_property
from http.cookies import SimpleCookie
from http.server import BaseHTTPRequestHandler
from urllib.parse import parse_qsl, urlparse

import http.server
import socketserver

from http.server import BaseHTTPRequestHandler, HTTPServer
import logging


print ("OK");

conn = psycopg2.connect(database="postgres",
                        host="127.0.0.1",
                        user="postgres",
                        password="db_pass",
                        port="5432")


cursor = conn.cursor()


class CHTTPServer:
  def __init__(self, port, cursor):
    server_address = ('', port)
    self.cursor = cursor
    server = HTTPServer(server_address,S)
    server.cursor = cursor
    try:
      server.serve_forever()
    except KeyboardInterrupt:
      pass
    server.server_close()
    logging.info('Stopping httpd...\n')

class S(BaseHTTPRequestHandler):
    def _set_response(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()

    def do_GET(self):
        logging.info("GET request,\nPath: %s\nHeaders:\n%s\n", str(self.path), str(self.headers))
        self._set_response()
        #self.wfile.write("GET request for {}".format(self.path).encode('utf-8'))
        self.server.cursor.execute("SELECT * FROM X order by random() limit 1")
        resp=cursor.fetchone()[0]

        r= """
        <html>
          <head>
            <style>
              body {{
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
                background: #bfecf7;
              }}

              .box{{
                background: #fff;
                font-family: Montserrat, sans-serif;;
                font-size: 24px;
                line-height: 30px;
                font-weight: bold;
                color: #009688;
                padding: 40px;
                box-shadow:
                    inset #009688 0 0 0 5px,
                inset #059c8e 0 0 0 1px,
                inset #0cab9c 0 0 0 10px,
                inset #1fbdae 0 0 0 11px,
                inset #8ce9ff 0 0 0 16px,
                inset #48e4d6 0 0 0 17px,
                inset #e5f9f7 0 0 0 21px,
                inset #bfecf7 0 0 0 22px;
                text-shadow: 3px 3px 1px #bfecf7;
              }}
            </style>
          </head>
          <body>
            <div class="box">{resp}</div>
          </body>
        </html>
        """
        vars = {'resp':resp}
        x = r.format(**vars)

        self.wfile.write(x.encode())


port=8000

logging.basicConfig(level=logging.INFO)
httpd = CHTTPServer(port, cursor)
