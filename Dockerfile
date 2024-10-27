<<<<<<< HEAD
# FROM php:8.2-fpm

# CMD ["php", "artisan", "serve", "--host", "0.0.0.0", "--port", "80"]

# # Install system dependencies
# RUN apt-get update && apt-get install -y \
#     git \
#     curl \
#     libpng-dev \
#     libonig-dev \
#     libxml2-dev \
#     zip \
#     unzip

# # Clear cache
# RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# # Install PHP extensions
# RUN docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

# # Get latest Composer
# COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# # Set working directory
# WORKDIR /var/www

# # Increase memory limit
# RUN echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini
# # Copy existing application directory contents
# COPY . /var/www

# # Install dependencies
# RUN composer install --no-interaction --no-dev --prefer-dist

# # Change ownership of our applications
# RUN chown -R www-data:www-data /var/www

# # # Expose port 9000 and start php-fpm server
# # EXPOSE 9000
# # CMD ["php-fpm"]
# EXPOSE 80
# CMD php artisan serve --host=0.0.0.0 --port=80
FROM php:8.2-fpm
=======
FROM php:8.3-fpm

# CMD ["php", "artisan", "serve", "--host", "0.0.0.0", "--port", "80"] 
>>>>>>> 22eac4a735c7d140b7bb81379e0d125e45d822d4

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    nodejs \
    npm

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Copy existing application directory contents
COPY . /var/www

# Install dependencies
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Set permissions
RUN chown -R www-data:www-data /var/www
RUN chmod -R 755 /var/www/storage

EXPOSE 80
CMD php artisan serve --host=0.0.0.0 --port=80
