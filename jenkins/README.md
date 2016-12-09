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

docker run \
    --detach \
    --name jenkins \
    --restart always \
    --publish 12080:8080 \
    --publish 50000:50000 \
    --volume /opt/jenkins:/var/jenkins_home \
    --volume /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/jenkins:latest
```

## after run
```
#查看初始化默认密码
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
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