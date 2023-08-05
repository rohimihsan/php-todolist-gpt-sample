# Use the official PHP-FPM base image
FROM php:7.4-fpm

# Set working directory to /var/www
WORKDIR /var/www

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql zip

# Copy your PHP application files to the container
COPY . /var/www

# Set appropriate permissions for the web server to access the files
RUN chown -R www-data:www-data /var/www

# Expose port 9000 for PHP-FPM
EXPOSE 8010

# Start PHP-FPM
CMD ["php-fpm"]
