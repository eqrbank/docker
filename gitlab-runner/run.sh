#!/usr/bin/env bash

mkdir -p /opt/gitlab-runner && chmod -R 777 /opt/gitlab-runner

docker run \
    --detach \
    --name gitlab-runner \
    --restart always \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --volume /opt/gitlab-runner/config:/etc/gitlab-runner \
    --volume /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/gitlab-runner:latest