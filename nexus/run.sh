#!/usr/bin/env bash

mkdir -p /mnt/nexus && chmod -R 777 /mnt/nexus

docker run \
    --detach \
    --name nexus \
    --restart always \
    --publish 10080:8081 \
    --env CONTEXT_PATH=/ \
    --volume /mnt/nexus:/sonatype-work \
    --volume /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/nexus:latest