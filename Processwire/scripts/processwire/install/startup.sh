#!/bin/bash

# Conditional actions depending if pw is already installed
if [ -f /var/www/html/site/assets/installed.php ]; then 
  # Change file permissions for PW installer
  mv ./htaccess.txt ./.htaccess
  chmod -R 777 ./.htaccess
  chmod -R 777 ./.gitignore

  # Remove install script
  rm install.php
else
  # Copy installation files
  mv -vn /var/www/html/site-blank/* /var/www/html/site/
  mv -vn /dockerScripts/processwire/config/* /var/www/html/site/

  # Add env vars to installation
  sed -i 's/case 2: $this->dbConfig();  break;/case 2: $this->dbConfig($_ENV);  break;/g' /var/www/html/install.php
fi;

# Remove blank-template
rm -rf ./site-blank

# set PW recommended assets permissions
mkdir -p ./site/assets
chmod -R 777 ./site/assets
# set PW recommended modules permissions
mkdir -p ./site/modules
chmod -R 777 ./site/modules

# set PW recommended config permissions
chmod 666 ./site/config.php
cp /var/www/html/wire ./site/assets/
  
# Install composer files
/var/www/html/site/templates/composer install | echo 'installed'

cp -rf /var/www/html/wire/ /var/www/html/site/assets/

# # Clean
apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/www/html/.git /dockerScripts

# Run Apache Server
apache2-foreground
