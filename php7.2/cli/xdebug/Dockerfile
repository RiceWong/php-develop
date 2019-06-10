FROM php7.2-cli-runtime:latest

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && echo 'xdebug.remote_enable = On \n\
xdebug.remote_host = 127.0.0.1 \n\
xdebug.remote_port = 10000 \n\
xdebug.remote_handler = "dbgp" \n\
xdebug.show_exception_trace = On \n\
xdebug.profiler_enable = 0 \n\
xdebug.profiler_enable_trigger = 1 '>> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini \
    && apt-get install -y python \
    && cd /tmp && curl -o dbgp.tar.gz http://downloads.activestate.com/Komodo/releases/11.1.0/remotedebugging/Komodo-PythonRemoteDebugging-11.1.0-91033-linux-x86_64.tar.gz?_ga=2.160493245.1029201801.1557125759-1262148606.1557125759 \
    && tar zxvf dbgp.tar.gz \
    && mv `ls -l|grep Komodo|awk '{print $9}'` /usr/local/dbgp && rm -rf dbgp.tar.gz

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
WORKDIR /var/www/
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]
EXPOSE 10001