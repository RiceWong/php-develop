FROM php:7.2.19-cli-stretch
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && echo 'precedence ::ffff:0:0/96  100' >> /etc/gai.conf \
    && echo '\
 deb http://mirrors.cloud.tencent.com/debian stretch main contrib non-free \n\
 deb http://mirrors.cloud.tencent.com/debian stretch-updates main contrib non-free \n\
 deb http://mirrors.cloud.tencent.com/debian stretch-backports main contrib non-free \n\
 deb-src http://mirrors.cloud.tencent.com/debian stretch main contrib non-free \n\
 deb-src http://mirrors.cloud.tencent.com/debian stretch-updates main contrib non-free \n\
 deb-src http://mirrors.cloud.tencent.com/debian stretch-backports main contrib non-free  \n\
 deb http://mirrors.cloud.tencent.com/debian buster main contrib non-free \n\
 deb http://mirrors.cloud.tencent.com/debian-security buster/updates  main contrib non-free \n\
 deb-src http://mirrors.cloud.tencent.com/debian buster main contrib non-free \n\
 deb-src http://mirrors.cloud.tencent.com/debian-security buster/updates  main contrib non-free \n\
 '>/etc/apt/sources.list \
    && apt-get clean all \
    && apt-get update \
    && apt-get install -y git