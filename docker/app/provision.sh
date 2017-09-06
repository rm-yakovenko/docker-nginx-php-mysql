#!/usr/bin/env bash

set -e

apt-get -y -qq update 
apt-get -y -qq install  git unzip libpng-dev libjpeg-dev libfreetype6-dev libicu-dev libmcrypt-dev libfontconfig1 libxrender1 libxtst6 --no-install-recommends

useradd -m app
docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
docker-php-ext-install -j$(nproc) pdo_mysql bcmath gd intl mcrypt opcache
curl -Lo /usr/bin/composer https://getcomposer.org/composer.phar
chmod +x /usr/bin/composer

if [ $XDEBUG ]
then
    pecl install xdebug
    docker-php-ext-enable xdebug
fi

#curl -Lo wkhtmltox.tar.gz https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
#tar -C /usr/local -xf wkhtmltox.tar.gz wkhtmltox --strip-components=1
#rm wkhtmltox.tar.gz

rm -r /var/lib/apt/lists/*
rm -rf /var/cache/apt/*
rm -rf /tmp/*