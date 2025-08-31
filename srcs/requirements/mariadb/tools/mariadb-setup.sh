#!/bin/bash
set -e

mkdir -p /run/mysqld

envsubst < /etc/mysql/template.sql > /etc/mysql/init.sql

echo "Starting MariaDB..."
exec "$@"