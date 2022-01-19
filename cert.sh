#!/bin/bash

openssl genrsa -out localhost-key.pem

openssl req -new -key localhost-key.pem -out csr.pem

openssl x509 -req -days 9999 -in csr.pem -signkey localhost-key.pem -out localhost.pem

rm csr.pem