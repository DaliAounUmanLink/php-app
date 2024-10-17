# Use the official PHP Apache image
FROM php:8.2-apache
 
# Copy the application files into the container
COPY . /var/www/html
 
# Set the working directory
WORKDIR /var/www/html
 
# Install PHP extensions
RUN docker-php-ext-install pdo_mysql
 
# Ensure Apache is using the proper configuration
COPY apache-config.conf /etc/apache2/sites-enabled/000-default.conf
 
EXPOSE 80
 
# Enable mod_rewrite for Apache
RUN a2enmod rewrite