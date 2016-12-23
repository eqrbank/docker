#!/usr/bin/env bash

#mkdir -p /opt/jenkins && chmod -R 777 /opt/jenkins
docker volume create --name tuleap-data

docker run \
    --detach \
    --name tuleap \
    --publish 13080:80 \
    --publish 13443:443 \
    --publish 13022:22 \
    --volume tuleap-data:/data \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/tuleap:latest
