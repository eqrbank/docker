#!/usr/bin/env bash

sh rm.sh
docker rmi registry.cn-hangzhou.aliyuncs.com/nichozuo/nginx:latest
sh run.sh