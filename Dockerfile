FROM php:5.6.40-cli-alpine3.8

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini" \
    && apk add --no-cache libxml2-dev curl libpng-dev icu-dev libxslt-dev git openssh-client \
    && docker-php-ext-install mbstring xml zip json gd intl xsl mysqli pdo pdo_mysql \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer --version=1.8.0 \
    && php -r "unlink('composer-setup.php');"
