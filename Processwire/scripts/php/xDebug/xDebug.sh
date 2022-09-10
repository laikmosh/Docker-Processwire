#!/bin/bash

# Install xDebug
pecl install -o -f xdebug && docker-php-ext-enable xdebug

# Include opcache.ini file
mv /dockerScripts/php/xDebug/xDebug.ini /usr/local/etc/php/conf.d/xDebug.ini
