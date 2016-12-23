#!/usr/bin/env bash
sh rm.sh
docker rmi registry.cn-hangzhou.aliyuncs.com/zuowenbo/gitlab-runner:latest
sh run.sh