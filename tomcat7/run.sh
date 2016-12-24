#!/usr/bin/env bash

echo "the name of container:"
read name

echo "the port of container:"
read port

echo "the ssl port of container:"
read ssl

docker volume create --name tomcat-webapps
docker volume create --name tomcat-logs
docker volume create --name tomcat-conf

docker run -d \
    --name $name \
    --restart=always \
    -p $port:8080 \
    -p $ssl:8443 \
    -v /opt/tomcat7/$name/logs:/usr/local/tomcat/logs \
    -v /opt/tomcat7/$name/webapps:/home/pelerin/conf \
    -v /opt/conf:/home/pelerin/conf \
    -v /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/zuowenbo/tomcat7

docker run \
    --detach \
    --name tomcat \
    --restart always \
    --publish 8080:8080 \
    --publish 8443:8443 \
    --volume tomcat-logs:/usr/local/tomcat/logs \
    --volume tomcat-webapps:/usr/local/tomcat/webapps \
    --volume tomcat-conf:/home/pelerin/conf \
    --volume /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/tomcat7:latest

