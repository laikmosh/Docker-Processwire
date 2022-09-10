#!/bin/bash

# Install Opcache
docker-php-ext-install opcache

# Include opcache.ini file
mv /dockerScripts/php/install/opcache-production.ini /usr/local/etc/php/conf.d/opcache.ini
