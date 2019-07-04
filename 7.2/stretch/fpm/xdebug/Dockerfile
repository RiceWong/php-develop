FROM rickywong/php:7.2-stretch-fpm

ENV DBGP_URL=http://downloads.activestate.com/Komodo/releases/11.1.0/remotedebugging/Komodo-PythonRemoteDebugging-11.1.0-91033-linux-x86_64.tar.gz
RUN apt-get update \
    && apt-get install -y python \
    # 配置 DBGP
    && cd /usr/src \
    && curl -o dbgp.tar.gz $DBGP_URL \
    && tar zxvf dbgp.tar.gz \
    && mv `ls -l|grep Komodo|awk '{print $9}'` /usr/local/dbgp \
    && rm -rf dbgp.tar.gz

ENV XDEBUG_VERSION=2.7.2

COPY ./docker-php-ext-xdebug.ini /tmp/

#$PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini

RUN cd /usr/src \
    && curl -O https://xdebug.org/files/xdebug-$XDEBUG_VERSION.tgz\
    && tar zxf xdebug-$XDEBUG_VERSION.tgz \
    && ( cd xdebug-$XDEBUG_VERSION && phpize && ./configure && make && make install && cd ..) \
    && rm -rf ./xdebug-* \
    && docker-php-ext-enable xdebug \
    && cat /tmp/docker-php-ext-xdebug.ini >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini \
    && rm /tmp/docker-php-ext-xdebug.ini

RUN apt-get clean \
        && apt-get autoremove \
        && rm -rf /var/lib/apt/lists/*
# 修改fpm配置项


COPY entrypoint.sh /entrypoint.sh

WORKDIR /var/www/

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/local/sbin/php-fpm", "-R"]

EXPOSE 9000
EXPOSE 10001