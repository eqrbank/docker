#!/usr/bin/env bash

docker volume create --name loveangel-web

docker run \
    --detach \
    --name loveangel-web \
    --restart always \
    --publish 8092:80 \
    --publish 8093:443 \
    --volume loveangel-web:/usr/share/nginx/html/ \
    --volume /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/nginx:latest