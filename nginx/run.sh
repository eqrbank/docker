#!/usr/bin/env bash

docker volume create --name nginx

docker run \
    --detach \
    --name nginx \
    --restart always \
    --publish 80:80 \
    --publish 443:443 \
    --volume nginx:/usr/share/nginx/html/ \
    --volume /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/nginx:latest