## Official site
https://hub.docker.com/r/richarvey/nginx-php-fpm/

## Dockerfile
```
FROM richarvey/nginx-php-fpm:latest
```

## run.sh
```
#!/usr/bin/env bash

mkdir -p /opt/nginx-php/log/nginx
mkdir -p /opt/nginx-php/html

docker run \
    --detach \
    --name nginx-php \
    --restart always \
    --publish 80:80 \
    --publish 443:443 \
    -v /opt/nginx-php/log:/var/log \
    -v /opt/nginx-php/html:/var/www/html \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/nginx-php:latest
```

## after run
```
# 修改session.save_path
vi /etc/php5/conf.d/php.ini

# 开始服务
http://192.168.11.111
```

## 部署禅道
```
#!/usr/bin/env bash

curl -o /tmp/zentaopms.zip http://dl.cnezsoft.com/zentao/8.4.1/ZenTaoPMS.8.4.1.zip
unzip -o -q /tmp/zentaopms.zip -d /opt/nginx-php/html/
docker cp zentaopms.conf nginx-php:/etc/nginx/sites-enabled/zentaopms.conf
docker restart nginx-php
```

## rm.sh
```
#!/usr/bin/env bash

docker stop nginx-php && docker rm nginx-php
```

## update.sh
```
#!/usr/bin/env bash

sh rm.sh
docker rmi registry.cn-hangzhou.aliyuncs.com/nichozuo/nginx-php:latest
sh run.sh
```