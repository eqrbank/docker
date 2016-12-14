#!/usr/bin/env bash

sh rm.sh
docker rmi registry.cn-hangzhou.aliyuncs.com/nichozuo/nginx-php:latest
sh run.sh