ARG PHP_VERSION
FROM php:${PHP_VERSION}-apache

# Copy installation files
WORKDIR /dockerScripts/php/
COPY ./scripts/php/ ./
RUN chmod -R +x ./

# Setup php
# Packages installation

# Install required php packages
RUN ./packages.sh

# Language packs
RUN ./localization.sh

# Utils
RUN ./utils.sh

# Opcache
RUN ./opcache/opcache-dev.sh

# xDebug
RUN ./xDebug/xDebug.sh

# Apply custom php.ini settings and dev settings
WORKDIR /usr/local/etc/php/
RUN mv ./php.ini-development ./php.ini
COPY ./scripts/php/php.ini ./conf.d/999_php.ini

# ProcessWire installation files
WORKDIR /dockerScripts/processwire/
COPY ./scripts/processwire/install/install.sh ./install/install.sh
RUN chmod -R +x ./

# Run PW installation script
WORKDIR /var/www/html
ARG PW_VERSION
RUN /dockerScripts/processwire/install/install.sh $PW_VERSION

# Set aplication ownership
WORKDIR /var/www/html
RUN chown -R www-data:www-data ./ 

# Get installation env vars
ARG DB_HOST
ARG DB_DATABASE
ARG DB_USERNAME
ARG DB_PASSWORD

# Set processwire env vars
ENV DB_DATABASE ${DB_DATABASE}
ENV DB_USERNAME ${DB_USERNAME}
ENV DB_PASSWORD ${DB_PASSWORD}
ENV DB_HOST ${DB_HOST}

# Set installation env vars
ENV dbName ${DB_DATABASE}
ENV dbUser ${DB_USERNAME}
ENV dbPass ${DB_PASSWORD}
ENV dbHost ${DB_HOST}
ENV dbPort 3306
ENV dbEngine InnoDB

# Install ProcessWire
WORKDIR /dockerScripts/processwire/
COPY ./scripts/processwire/config ./config
COPY ./scripts/processwire/install/startup.sh ./install/startup.sh
RUN chmod -R +x ./

# Install composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Start Apache server
WORKDIR /var/www/html
CMD ["/dockerScripts/processwire/install/startup.sh"]
