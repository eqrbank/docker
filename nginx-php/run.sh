#!/usr/bin/env bash

docker volume create --name nginx

docker volume create --name nginx-log

docker run \
    --detach \
    --name nginx-php \
    --restart always \
    --publish 80:80 \
    --publish 443:443 \
    --volume nginx-log:/var/log \
    --volume nginx:/var/www/html \
    --volume /etc/localtime:/etc/localtime:ro \
    --link mysql:mysql \
    --link redis:redis \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/nginx-php:latest