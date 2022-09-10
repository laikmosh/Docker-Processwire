# ProcessWire Docker Image

[![Go to Docker Hub](https://img.shields.io/badge/Docker%20Hub-%E2%86%92-blue.svg)](https://hub.docker.com/r/laikmosh/processwire-docker)
[![Go to Git Hub](https://img.shields.io/badge/Github%20repo-%E2%86%92-black.svg)](https://github.com/laikmosh/docker-processwire.git)

Dockerized Processwire installation and development enviroment

- Local enviroment with MariaDB container included
- Mount local filesystem
- Processwire versions
- VSCode Itelliphense configuration
- xDebug preconfigured
- Opcache + JIT ready (xDebug must be disabled)

---

## Installation & usage

### Development enviroment installation

Build using local script

```sh
$ git clone https://github.com/laikmosh/docker-processwire.git
$ cd docker-processwire
$ docker-compose up
```

There is also a `config-dev.php` file in the `./site/` folder, this file is in the `.dockerignore`, so it wont be incluided at image building time.

Custom `php.ini` settings can be set at:

```sh
/Processwire/scripts/php/php.ini
```

\*Image must be rebuilt for changes on `php.ini` to take effect

---

### Development enviroment usage

Configure .env file for project and DB settings, default database credentials are:

```sh
Database: {COMPOSE_PROJECT_NAME}
User: admin
Password: password
Server: database
Port: 3306
```

Editable files and templates will be installed to the `./site/` folder.

## Processwire documentation

- [ProcessWire](https://www.processwire.com)
- [ProcessWire Repo](https://github.com/processwire/)
- [ProcessWire Documentation](https://www.processwire.com/docs/)
