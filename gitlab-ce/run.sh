#!/usr/bin/env bash

mkdir -p /opt/gitlab-ce && chmod -R 777 /opt/gitlab-ce

docker run \
    --detach \
    --name gitlab-ce \
    --restart always \
    --hostname git.saipeisi.com \
    --publish 11443:443 \
    --publish 11080:11080 \
    --publish 11022:22 \
    --volume /opt/gitlab-ce/config:/etc/gitlab \
    --volume /opt/gitlab-ce/logs:/var/log/gitlab \
    --volume /opt/gitlab-ce/data:/var/opt/gitlab \
    --volume /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/gitlab-ce:latest