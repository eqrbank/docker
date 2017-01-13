#!/usr/bin/env bash

docker run \
    --detach \
    --name gitlab-runner-maven \
    --restart always \
    --volume /root/.ssh:/root/.ssh \
    --volume /root/.m2:/root/.m2 \
    --volume /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/gitlab-runner-maven:latest