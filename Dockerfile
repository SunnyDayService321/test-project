FROM php:8.1-fpm

# PHPの拡張機能をインストール
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql zip

# Composerのインストール
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# アプリケーションファイルをコピー
COPY . .

# 依存関係のインストール
RUN composer install --no-interaction --no-dev --prefer-dist

# 権限の設定
RUN chown -R www-data:www-data /var/www/html/storage

# Apacheの設定（必要に応じて）
RUN a2enmod rewrite