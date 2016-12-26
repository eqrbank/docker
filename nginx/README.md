## Official site
https://hub.docker.com/_/nginx/

## Dockerfile
```
FROM nginx:latest
```

## run.sh
```
#!/usr/bin/env bash

docker volume create --name nginx

docker run \
    --detach \
    --name nginx \
    --restart always \
    --publish 80:80 \
    --publish 443:443 \
    --volume nginx:/usr/share/nginx/html/ \
    --volume /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/nginx:latest
```

## after run
```
# 开始服务
http://192.168.11.111
```
## rm.sh
```
#!/usr/bin/env bash

docker rm -f nginx
```

## update.sh
```
#!/usr/bin/env bash

sh rm.sh
docker rmi registry.cn-hangzhou.aliyuncs.com/nichozuo/nginx:latest
sh run.sh
```