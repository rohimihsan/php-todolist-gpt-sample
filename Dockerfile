# Stage 1: Build PHP Application
FROM php:7.4-fpm AS builder

# Set working directory
WORKDIR /app

RUN apk update && apk add --no-cache \
build-base shadow vim curl \
php7 \
php7-fpm \
php7-common \
php7-pdo \
php7-pdo_mysql \
docker-php-ext-install \
php7-mysqli \
php7-mcrypt \
php7-mbstring \
php7-xml \
php7-openssl \
php7-json \
php7-phar \
php7-zip \
php7-gd \
php7-dom \
php7-session \
php7-zlib

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
