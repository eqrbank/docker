## Official site
https://hub.docker.com/_/mysql/

## Dockerfile
```
FROM mysql:latest
```

## run.sh
```
#!/usr/bin/env bash

mkdir -p /opt/mysql

docker run \
    --detach \
    --name mysql \
    --restart always \
    --publish 3306:3306 \
    --volume /opt/mysql:/var/lib/mysql \
    --env MYSQL_ROOT_PASSWORD=123456 \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/mysql:latest
```

## rm.sh
```
#!/usr/bin/env bash

docker stop mysql && docker rm mysql
```

## update.sh
```
#!/usr/bin/env bash

sh rm.sh
docker rmi registry.cn-hangzhou.aliyuncs.com/nichozuo/mysql:latest
sh run.sh
```