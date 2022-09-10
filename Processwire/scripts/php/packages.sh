#!/bin/bash

# Processwire requirements: mod_rewrite
a2enmod rewrite
service apache2 restart

# Processwire requirements: GD >2.0
# GD requirements:
apt-get update \
&& apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libwebp-dev \
    libzip-dev \
    git


# Processwire requirements:
docker-php-ext-install \
  pdo_mysql \
  mysqli \
  zip \
  mbstring \
  exif

# Processwire requirements: GD >2.0
docker-php-ext-configure gd --with-webp=/usr/include/ --with-jpeg=/usr/include/ --with-freetype=/usr/include/
docker-php-ext-install -j$(nproc) gd 

# Cleanup
docker-php-source delete
