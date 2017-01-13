#!/usr/bin/env bash

mkdir -p /mnt/gitlab-ce && chmod -R 777 /mnt/gitlab-ce

docker run \
    --detach \
    --name gitlab-ce \
    --restart always \
    --hostname 192.168.11.111 \
    --publish 11443:443 \
    --publish 11080:11080 \
    --publish 11022:22 \
    --volume /mnt/gitlab-ce/config:/etc/gitlab \
    --volume /mnt/gitlab-ce/logs:/var/log/gitlab \
    --volume /mnt/gitlab-ce/data:/var/opt/gitlab \
    --volume /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/gitlab-ce:latest