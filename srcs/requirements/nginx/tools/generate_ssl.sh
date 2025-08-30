#!/bin/bash
set -e

# create directory if it doesn't exist
mkdir -p /etc/nginx/ssl

# generate private key
openssl genrsa -out /etc/nginx/ssl/nginx.key 2048

# generate self-signed certificate
openssl req -new -x509 -key /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -days 365 \
        -subj "/C=FR/ST=Paris/L=Paris/O=42School/CN=oprosvir.42.fr"

# set proper permissions
chmod 600 /etc/nginx/ssl/nginx.key
chmod 644 /etc/nginx/ssl/nginx.crt