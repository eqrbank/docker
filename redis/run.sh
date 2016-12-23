#!/usr/bin/env bash

docker volume create --name redis

docker run \
    --detach \
    --name redis \
    --restart always \
    --publish 6379:6379 \
    --volume redis:/data \
    --volume /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/redis:latest
