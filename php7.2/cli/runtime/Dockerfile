FROM php7.2-cli-base:latest
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev net-tools iputils-ping procps tofrodos  \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && apt-get install -y libxml2-dev \
    && apt-get install -y libxslt-dev \
    && docker-php-ext-install xsl \
    && apt-get install -y libbz2-dev \
    && docker-php-ext-install bz2 \
    && docker-php-ext-install zip \
    && docker-php-ext-install pcntl \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install exif \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install sockets \
    && docker-php-ext-install gettext \
    && docker-php-ext-install sysvmsg \
    && docker-php-ext-install sysvsem \
    && docker-php-ext-install sysvshm \
    && docker-php-ext-install opcache

RUN cd /tmp/ \
    && git clone -b '3.1.6' https://github.com/phpredis/phpredis.git redis-3.1.6 \
    && ( cd redis-3.1.6 && phpize && ./configure && make && make install && cd ..) \
    && rm -r redis-3.1.6 \
    && docker-php-ext-enable redis

RUN apt-get install -y \
    tcpdump \
    net-tools \
    nmap \
    iputils-ping \
    && apt-get clean