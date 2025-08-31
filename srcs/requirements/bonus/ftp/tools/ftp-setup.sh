#!/bin/bash
set -e

echo "Setting up FTP server..."

# create ftpuser if it doesn't exist
if ! id -u ftpuser > /dev/null 2>&1; then
    echo "Creating FTP user..."
    useradd -m -d /var/www/html -g www-data ftpuser
    echo "ftpuser:${FTP_PASSWORD}" | chpasswd
fi

# give proper permissions to the WordPress directory
chmod -R 775 /var/www/html
chown -R www-data:www-data /var/www/html

echo "FTP configured to WordPress volume!"
echo "Starting vsftpd..."

exec "$@"