FROM php:7-fpm

RUN apt-get -y update && \
    apt-get -y install --no-install-recommends git unzip libpng-dev libjpeg-dev libfreetype6-dev libicu-dev libzip-dev libxml2-dev libxslt-dev libwebp-dev && \
    docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ --with-webp=/usr && \
    docker-php-ext-install -j$(nproc) pdo_mysql bcmath gd intl opcache zip soap xsl && \
    pecl install apcu && \
    docker-php-ext-enable apcu && \
    apt-get clean && \
    rm -r /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt/* && \
    rm -rf /tmp/*

RUN curl -Lo /usr/bin/composer https://getcomposer.org/composer-stable.phar && \
    chmod +x /usr/bin/composer

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash && \
    apt-get install -y nodejs

ARG CONTAINER_USER
RUN useradd -m app -u $CONTAINER_USER

ARG XDEBUG

RUN if [ $XDEBUG ]; then pecl install xdebug && docker-php-ext-enable xdebug; fi

USER app
CMD ["php-fpm", "-F", "-R"]