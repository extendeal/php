# PHP for building & developing

## Usage
1. Copy or mount your project
1. Run php commands, composer, etc.

### Install Dependencies
To install new dependencies you can use `apk add` and `docker-php-ext-install`.

##### Example:
```bash
apk add --no-cache libxml2-dev curl libpng-dev icu-dev libxslt-dev git openssh-client
docker-php-ext-install mbstring xml zip json gd intl xsl mysqli pdo pdo_mysql
```

Check the [original php docker image](https://hub.docker.com/_/php/) documentation for more details.

## Configs

### PHP
- `$PHP_INI_DIR/php.ini`
- `$PHP_INI_DIR/conf.d/*`

## Develop

### How to push a new image / create a new version?
This image is auto-built and published by docker hub when a new tag is pushed to git.
The image tag will be equal to the git tag.
