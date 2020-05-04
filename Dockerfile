FROM php:7.3-apache

RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo pdo_mysql

#IMAP
RUN apt-get update && \
    apt-get install -y \
        libc-client-dev libkrb5-dev && \
    rm -r /var/lib/apt/lists/*
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-install -j$(nproc) imap

#ZEND OPcache
RUN docker-php-ext-install opcache
#COPY docker/php/conf.d/opcache.ini /usr/local/etc/php/conf.d/opcache.ini

COPY ./osTicket /var/www/html
RUN chmod 0666 /var/www/html/include/ost-config.php
