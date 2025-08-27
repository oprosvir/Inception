#!/bin/bash
set -e

echo "Starting WordPress setup..."
echo "Waiting for MariaDB to be ready..."

# wait until MariaDB is ready
until mysqladmin ping -h"$DB_HOST" --silent; do
  sleep 1
done

echo "MariaDB is ready!"

# move to the web root
cd /var/www/html

# check if WP is already installed
if [ ! -f wp-config.php ]; then
    echo "WordPress not found. Installing..."

    # download WP core files
    wp core download --allow-root
    
    # create config with custom DB settings
    wp config create --allow-root \
        --dbname=${MYSQL_DATABASE} \
        --dbuser=${MYSQL_USER} \
        --dbpass=${MYSQL_PASSWORD} \
        --dbhost=${DB_HOST} \
        --skip-check # to avoid connection check in a containerized environment
    
    # install WP with custom settings
    # admin user
    wp core install --allow-root \
        --url=${URL} \
        --title="${TITLE}" \
        --admin_user=${WP_ADMIN_USER} \
        --admin_password=${WP_ADMIN_PASSWORD} \
        --admin_email=${WP_ADMIN_EMAIL} \
        --skip-email # to avoid sending email in a containerized environment
    
    # create a secondary user with editor role
    wp user create ${WP_USER} ${WP_USER_EMAIL} \
        --user_pass=${WP_USER_PASSWORD} \
        --role=editor \
        --allow-root
    
    echo "✅ WordPress installed and configured successfully!"
    
else
    echo "✅ WordPress already installed, skipping setup..."
fi

echo "Starting PHP-FPM..."

exec "$@"
