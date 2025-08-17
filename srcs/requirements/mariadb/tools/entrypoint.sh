#!/bin/bash
set -e

echo "Preparing runtime directories..."
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

if [ ! -d "/var/lib/mysql/mysql" ]; then
  echo "Database not initialized. Starting initialization process..."

  echo "Creating MariaDB system tables..."
  mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

  echo "Starting temporary MariaDB instance..."
  mysqld --user=mysql --skip-networking --socket=/tmp/mysql.sock &
  mysql_pid=$!

  echo "Waiting for MariaDB to start..."
  for i in {1..30}; do
    if mysqladmin --socket=/tmp/mysql.sock ping >/dev/null 2>&1; then
      echo "MariaDB is ready!"
      break
    fi
    echo "Waiting... ($i/30)"
    sleep 1
  done

  echo "Applying custom database configuration..."
  envsubst < /docker-entrypoint-initdb.d/init.sql | mysql --socket=/tmp/mysql.sock

  echo "Shutting down temporary MariaDB instance..."
  kill $mysql_pid
  wait $mysql_pid

  echo "Database initialization completed successfully!"
else
  echo "Database already initialized, skipping initialization process."
fi

echo "Starting MariaDB server..."
exec mysqld --user=mysql