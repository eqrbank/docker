#!/usr/bin/env bash

mkdir -p /opt/gitlab-runner && chmod -R 777 /opt/gitlab-runner

docker run -d \
    --name gitlab-runner \
    --restart always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /opt/gitlab-runner/config:/etc/gitlab-runner \
    -v /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/zuowenbo/gitlab-runner:latest