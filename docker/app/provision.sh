#!/usr/bin/env bash

set -e

apt-get -y -qq update 
apt-get -y -qq install  git unzip libpng-dev libjpeg-dev libfreetype6-dev libicu-dev libfontconfig1 libxrender1 libxtst6 libzip-dev --no-install-recommends

docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
docker-php-ext-install -j$(nproc) pdo_mysql bcmath gd intl opcache zip
curl -Lo /usr/bin/composer https://getcomposer.org/composer.phar
chmod +x /usr/bin/composer

if [ $XDEBUG ]
then
    pecl install xdebug
    docker-php-ext-enable xdebug
fi

pecl install apcu
docker-php-ext-enable apcu

rm -r /var/lib/apt/lists/*
rm -rf /var/cache/apt/*
rm -rf /tmp/*