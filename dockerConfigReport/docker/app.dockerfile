FROM php:7.3.3-fpm

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && apt-get update && apt-get install -y libmcrypt-dev \
    mysql-client libmagickwand-dev --no-install-recommends \
    libzip-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && pecl install xdebug  \
    && docker-php-ext-enable xdebug  \
    && docker-php-source delete \
    && docker-php-ext-install -j5 gd mbstring mysqli pdo pdo_mysql shmop \
    && docker-php-ext-install zip \

    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_handler=dbgp" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_connect_back=0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.idekey=PHPSTORM" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_host=192.168.8.225" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.PHP_IDE_CONFIG='serverName=php-fpm'" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \

RUN chown -R www-data:www-data /var/www



