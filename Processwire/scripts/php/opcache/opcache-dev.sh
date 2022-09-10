#!/bin/bash

# Install Opcache
docker-php-ext-install opcache

# Include opcache.ini file
mv /dockerScripts/php/opcache/opcache-development.ini /usr/local/etc/php/conf.d/opcache.ini
