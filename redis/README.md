## Official site
https://hub.docker.com/_/redis/

## Dockerfile
```
FROM redis:latest
```

## run.sh
```
#!/usr/bin/env bash

docker volume create --name redis

docker run \
    --detach \
    --name redis \
    --restart always \
    --volume redis:/data \
    --volume /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/redis:latest
```

## rm.sh
```
#!/usr/bin/env bash

docker rm -f redis
```

## update.sh
```
#!/usr/bin/env bash

sh rm.sh
docker rmi registry.cn-hangzhou.aliyuncs.com/nichozuo/redis:latest
sh run.sh
```