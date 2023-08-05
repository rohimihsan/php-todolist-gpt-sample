# Stage 1: Build PHP Application
FROM php:7.4-fpm AS builder

# Set working directory
WORKDIR /app

# Install PHP extensions (add more if needed)
RUN docker-php-ext-install pdo pdo_mysql

# Copy your PHP application files to the container
COPY . /app

# Stage 2: Final Production Image
FROM nginx:latest

# Copy PHP application from the builder stage to Nginx's web root
COPY --from=builder /app /usr/share/nginx/html

# Remove default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom Nginx configuration
COPY nginx.conf /etc/nginx/conf.d

# Expose port 80 (the default Nginx port)
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]