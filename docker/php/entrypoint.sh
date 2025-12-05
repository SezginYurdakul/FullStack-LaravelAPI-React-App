#!/bin/sh

# Fix permissions for Laravel storage and cache directories
if [ -d "/var/www/backend/storage" ]; then
    chown -R www-data:www-data /var/www/backend/storage
    chmod -R 775 /var/www/backend/storage
fi

if [ -d "/var/www/backend/bootstrap/cache" ]; then
    chown -R www-data:www-data /var/www/backend/bootstrap/cache
    chmod -R 775 /var/www/backend/bootstrap/cache
fi

# Execute the main command
exec "$@"
