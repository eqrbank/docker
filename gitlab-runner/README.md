## Official site
https://hub.docker.com/r/gitlab/gitlab-runner/

## Dockerfile
```
FROM gitlab/gitlab-runner:latest
```

## run.sh
```
#!/usr/bin/env bash

mkdir -p /mnt/gitlab-runner && chmod -R 777 /mnt/gitlab-runner

docker run \
    --detach \
    --name gitlab-runner \
    --restart always \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --volume /mnt/gitlab-runner/config:/etc/gitlab-runner \
    --volume /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/gitlab-runner:latest
```

## after run

## rm.sh
```
#!/usr/bin/env bash

docker rm -vf gitlab-runner
```

## update.sh
```
#!/usr/bin/env bash

sh rm.sh
docker rmi registry.cn-hangzhou.aliyuncs.com/nichozuo/gitlab-runner:latest
sh run.sh
```