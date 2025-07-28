#!/bin/bash
set -e

if [ ! -d "/var/lib/mysql/mysql" ]; then
  echo "Initializing MariaDB data directory..."
  mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
fi

echo "Starting MariaDB server..."
exec mysqld --user=mysql