#!/usr/bin/env bash

mkdir -p /opt/jar-test && chmod -R 777 /opt/jar-test

docker run \
    --detach \
    --name jar-test \
    --restart always \
    --publish 8080:8080 \
    --volume /opt/jar-test:/home/jar \
    --volume /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/jar-runner:latest