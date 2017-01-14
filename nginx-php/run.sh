#!/usr/bin/env bash
#docker volume create --name nginx
#docker volume create --name nginx-log
mkdir -p /opt/nginx-php/html
mkdir -p /opt/nginx-php/log

docker run \
    --detach \
    --name nginx-php \
    --restart always \
    --publish 80:80 \
    --publish 443:443 \
    --volume /opt/nginx-php/log:/var/log \
    --volume /opt/nginx-php/html:/var/www/html \
    --volume /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/nginx-php:latest