#!/usr/bin/env bash

sh rm.sh
docker rmi registry.cn-hangzhou.aliyuncs.com/nichozuo/gitlab-runner-maven:latest
sh run.sh