# Docker Nginx Php Mysql ![](https://api.travis-ci.org/rm-yakovenko/docker-nginx-php-mysql.svg?branch=master)

Ready to run docker containers for php development.

## Getting started

1. Copy `.env.dist` to `.env`.
1. Configure `.env` if you need.
1. Copy `.env`, `docker`, `docker-compose.dev.yml` and `docker-compose.yml` to your app's root folder.
1. Enable dev mode `ln -sr docker-compose.dev.yml docker-compose.override.yml`.
1. Run `docker compose up -d`.
1. Open in your browser http://localhost:8080/ to access the app.

## Useful tips

### Running composer install

```sh
docker/console composer install
```

### Get into the container

```sh
docker/console bash
```
