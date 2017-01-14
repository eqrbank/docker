## Official site
https://hub.docker.com/r/sonatype/nexus/

## Dockerfile
```
FROM sonatype/nexus:latest
```

## run.sh
```
#!/usr/bin/env bash

mkdir -p /opt/nexus && chmod -R 777 /opt/nexus

docker run \
    --detach \
    --name nexus \
    --restart always \
    --publish 10080:8081 \
    --env CONTEXT_PATH=/ \
    --volume /opt/nexus:/sonatype-work \
    --volume /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/nexus:latest
```

## after run
```
# 访问服务
http://192.168.11.111:10080
user:admin
pass:admin123
```

## rm.sh
```
#!/usr/bin/env bash

docker rm -f nexus
```

## update.sh
```
#!/usr/bin/env bash

sh rm.sh
docker rmi registry.cn-hangzhou.aliyuncs.com/nichozuo/nexus:latest
sh run.sh
```