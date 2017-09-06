FROM php:7-fpm

ARG XDEBUG
COPY ./provision.sh /

RUN bash /provision.sh

ADD app.ini /usr/local/etc/php/conf.d
ADD xdebug.ini /usr/local/etc/php/conf.d
ADD www.conf /usr/local/etc/php-fpm.d

#USER app

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["php-fpm", "-F", "-R"]

EXPOSE 9000