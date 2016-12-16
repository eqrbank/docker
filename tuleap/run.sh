#!/usr/bin/env bash

#mkdir -p /opt/jenkins && chmod -R 777 /opt/jenkins
docker volume create --name tuleap-data

docker run \
    -ti \
    -p 13080:80 \
    -p 13443:443 \
    -p 13022:22 \
    -v tuleap-data:/data \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/tuleap:latest
