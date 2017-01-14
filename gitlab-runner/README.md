## Official site
https://hub.docker.com/r/gitlab/gitlab-runner/

## Dockerfile
```
FROM gitlab/gitlab-runner:latest
```

## run.sh
```
#!/usr/bin/env bash

mkdir -p /opt/gitlab-runner && chmod -R 777 /opt/gitlab-runner

docker run \
    --detach \
    --name gitlab-runner \
    --restart always \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --volume /opt/gitlab-runner/config:/etc/gitlab-runner \
    --volume /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/gitlab-runner:latest
```

## rm.sh
```
#!/usr/bin/env bash

docker rm -f gitlab-runner
```

## update.sh
```
#!/usr/bin/env bash

sh rm.sh
docker rmi registry.cn-hangzhou.aliyuncs.com/nichozuo/gitlab-runner:latest
sh run.sh
```

## after install
#### register runner
```
docker exec -it gitlab-runner gitlab-runner register

Please enter the gitlab-ci coordinator URL (e.g. https://gitlab.com )
https://gitlab.com
Please enter the gitlab-ci token for this runner
xxx
Please enter the gitlab-ci description for this runner
my-runner
INFO[0034] fcf5c619 Registering runner... succeeded
Please enter the executor: shell, docker, docker-ssh, ssh?
docker
Please enter the Docker image (eg. ruby:2.1):
ruby:2.1
INFO[0037] Runner registered successfully. Feel free to start it, but if it's
running already the config should be automatically reloaded!
```