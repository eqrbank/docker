#!/usr/bin/env bash

docker volume create --name mysql

docker run \
    --detach \
    --name mysql \
    --restart always \
    --volume mysql:/var/lib/mysql \
    --volume /etc/localtime:/etc/localtime:ro \
    --env MYSQL_ROOT_PASSWORD=m5f70YLQaZPL \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/mysql:latest
