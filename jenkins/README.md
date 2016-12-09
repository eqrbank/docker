## Official site
https://hub.docker.com/_/jenkins/

## Dockerfile
```
FROM jenkins:latest
```

## run.sh
```
#!/usr/bin/env bash

mkdir -p /opt/jenkins && chmod -R 777 /opt/jenkins

docker run -d \
    --name jenkins \
    --restart=always \
    -p 8080:8080 \
    -p 50000:50000 \
    -v /opt/jenkins:/var/jenkins_home \
    -v /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/jenkins:latest
```
## rm.sh
```
#!/usr/bin/env bash

docker stop jenkins && docker rm jenkins
```

## update.sh
```
#!/usr/bin/env bash

sh rm.sh
docker rmi registry.cn-hangzhou.aliyuncs.com/nichozuo/jenkins:latest
sh run.sh
```