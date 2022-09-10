#!/bin/bash

# Get PW version from docker run argument
version=$1

# Install Processwire on empty WORKDIR folder
rm -rf ./*
git clone --depth 1 --branch $version https://github.com/processwire/processwire.git ./

# Remove .git
rm -rf ./git

# Change file permissions for PW installer
chmod -R 777 ./htaccess.txt
chmod -R 777 ./install.php
chmod -R 777 ./.gitignore
