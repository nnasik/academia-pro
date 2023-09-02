# Use an official PHP-FPM image as a parent image
FROM php:8.0-fpm

# Set the working directory in the container
WORKDIR /var/www/html

# Install required PHP extensions (add more if needed)
RUN docker-php-ext-install pdo pdo_mysql

RUN pecl install mongodb

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy the Laravel application code into the container
COPY . .

# Install Laravel dependencies using Composer
RUN composer install

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]
