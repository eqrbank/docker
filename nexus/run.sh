#!/usr/bin/env bash

mkdir -p /opt/nexus && chmod -R 777 /opt/nexus

docker run \
    --detach \
    --name nexus \
    --restart always \
    --publish 10080:8081 \
    --volume /opt/nexus:/sonatype-work \
    --volume /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/nexus:latest