## Official site
https://hub.docker.com/r/gitlab/gitlab-runner/

## Dockerfile
```
FROM gitlab/gitlab-runner:latest
```

## run.sh
```
#!/usr/bin/env bash

mkdir -p /opt/gitlab-ce && chmod -R 777 /opt/gitlab-ce

docker run \
    --detach \
    --name gitlab-ce \
    --restart always \
    --hostname 192.168.11.111 \
    --publish 11443:443 \
    --publish 11080:11080 \
    --publish 11022:22 \
    --volume /opt/gitlab-ce/config:/etc/gitlab \
    --volume /opt/gitlab-ce/logs:/var/log/gitlab \
    --volume /opt/gitlab-ce/data:/var/opt/gitlab \
    --volume /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/gitlab-ce:latest
```

## after run
##### vim gitlab.rb
```
# 编辑配置文件
vim /opt/gitlab-ce/config/gitlab.rb

# 编辑的内容
external_url 'http://192.168.11.111:11080'
gitlab_rails['gitlab_shell_ssh_port'] = 11022

# 重启容器
docker restart gitlab-ce

# 访问服务
http://192.168.11.111:11080
user:root
```

## rm.sh
```
#!/usr/bin/env bash

docker stop gitlab-ce && docker rm gitlab-ce
```

## update.sh
```
#!/usr/bin/env bash

sh rm.sh
docker rmi registry.cn-hangzhou.aliyuncs.com/nichozuo/gitlab-ce:latest
sh run.sh
```