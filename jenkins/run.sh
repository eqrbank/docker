#!/usr/bin/env bash

mkdir -p /opt/jenkins && chmod -R 777 /opt/jenkins

docker run \
    --detach \
    --name jenkins \
    --restart always \
    --publish 12080:8080 \
    --publish 50000:50000 \
    --volume /opt/jenkins:/var/jenkins_home \
    --volume /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/jenkins:latest