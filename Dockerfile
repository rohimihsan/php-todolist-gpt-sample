# Use the official PHP-FPM image as the base image
FROM php:fpm

# Install NGINX
RUN apt-get update && apt-get install -y nginx

# Remove default NGINX configuration
RUN rm /etc/nginx/sites-enabled/default

# Copy the custom NGINX configuration file to the container
COPY default.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/

# Copy PHP application files to the container
COPY app_files/ /var/www/html

# Expose the ports
EXPOSE 80

# Start PHP-FPM (runs in the foreground)
CMD ["php-fpm"]

# Start NGINX in the background
CMD ["nginx", "-g", "daemon off;"]