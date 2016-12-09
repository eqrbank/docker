#!/usr/bin/env bash

mkdir -p /opt/jenkins && chmod -R 777 /opt/jenkins

docker run -d \
    --name jenkins \
    --restart=always \
    -p 12080:8080 \
    -p 50000:50000 \
    -v /opt/jenkins:/var/jenkins_home \
    -v /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/zuowenbo/jenkins