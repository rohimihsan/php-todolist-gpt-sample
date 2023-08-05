# Use the official PHP image as the base image
FROM php:latest

# Install required PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Install NGINX
RUN apt-get update && apt-get install -y nginx

# Remove default NGINX configuration
RUN rm /etc/nginx/sites-enabled/default

# Copy the custom NGINX configuration file to the container
COPY default.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/

# Copy PHP application files to the container
COPY . /var/www/html

# Expose the ports
EXPOSE 80

# Start both NGINX and PHP-FPM services
CMD ["php-fpm"]

