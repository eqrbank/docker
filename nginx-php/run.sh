#!/usr/bin/env bash

mkdir -p /opt/nginx-php/log/nginx
mkdir -p /opt/nginx-php/html

docker run \
    --detach \
    --name nginx-php \
    --restart always \
    --publish 80:80 \
    --publish 443:443 \
    -v /opt/nginx-php/log:/var/log \
    -v /opt/nginx-php/html:/var/www/html \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/nginx-php:latest