FROM php:8.2-cli-alpine

RUN apk add --no-cache \
    git \
    curl \
    unzip \
    build-base \
    wget \
    ffmpeg \
    && rm -rf /var/cache/apk/*

# Pour installer les extensions PHP
ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN install-php-extensions sockets bcmath

WORKDIR /app
RUN git clone https://gitlab.com/Eevee89/php-app.git .

RUN composer update
RUN composer install --no-interaction --prefer-dist
RUN composer require php-amqplib/php-amqplib