<?php

namespace ProcessWire;

require_once 'config.php';
/**
 * ProcessWire Configuration File
 *
 * Site-specific configuration for ProcessWire
 *
 * Please see the file /wire/config.php which contains all configuration options you may
 * specify here. Simply copy any of the configuration options from that file and paste
 * them into this file in order to modify them.
 * 
 * SECURITY NOTICE
 * In non-dedicated environments, you should lock down the permissions of this file so
 * that it cannot be seen by other users on the system. For more information, please
 * see the config.php section at: https://processwire.com/docs/security/file-permissions/
 * 
 * This file is licensed under the MIT license
 * https://processwire.com/about/license/mit/
 *
 * ProcessWire 3.x, Copyright 2022 by Ryan Cramer
 * https://processwire.com
 *
 */

# Use only default config.php if processwire is not installed yet
if (!$config->dbHost) return;

unset($config->dbReader);
$config->dbHost = $_ENV['DB_HOST'];
$config->dbName = $_ENV['DB_DATABASE'];
$config->dbUser = $_ENV['DB_USERNAME'];
$config->dbPass = $_ENV['DB_PASSWORD'];
if ($_ENV['DB_HOST_READER']) {
  $config->dbReader = [
    'host' => $_ENV['DB_HOST_READER']
  ];
}

/**
 * Installer: Debug mode?
 * 
 * When debug mode is true, errors and exceptions are visible. 
 * When false, they are not visible except to superuser and in logs. 
 * Should be true for development sites and false for live/production sites. 
 * 
 */
$config->debug = true;
$config->moduleInstall('download', true);

$config->noHTTPS = true;
