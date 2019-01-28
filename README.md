# PHP-FPM & NGINX

## Usage
1. Copy or mount your project to `/opt/app/`
1. Install required dependencies (see below)
1. Tune config files (TODO accept env variables for any config parameter)
1. Publish port 80 to send requests

### Install Dependencies
This image only installs `nginx` (the same way the original images do) and supervisor.
To install new dependencies you can use `apk add` and `docker-php-ext-install`.

##### Example:
```dockerfile
RUN apk add --no-cache --virtual .api-deps libxml2-dev curl libpng-dev icu-dev libxslt-dev \
    && apk add --no-cache icu \
    && docker-php-ext-install mbstring xml zip json gd intl xsl mysqli pdo pdo_mysql \
    && apk del .api-deps
```

Check the [original php docker image](https://hub.docker.com/_/php/) documentation for more details.

## Configs

### PHP
- `$PHP_INI_DIR/php.ini`
- `$PHP_INI_DIR/conf.d/*`

### FPM
- `/usr/local/etc/php-fpm.conf`
- `/usr/local/etc/php-fpm.d/*`

### Nginx
- root: `/opt/app/public`

## Develop

### How to push a new image / create a new version?
This image is auto-built and published by docker hub when a new tag is pushed to git.
The image tag will be equal to the git tag.
