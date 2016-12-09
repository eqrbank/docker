#!/usr/bin/env bash
sh rm.sh
docker rmi registry.cn-hangzhou.aliyuncs.com/zuowenbo/jenkins:latest
sh run.sh