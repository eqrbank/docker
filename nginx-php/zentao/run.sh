#!/usr/bin/env bash

curl -o /tmp/zentaopms.zip http://dl.cnezsoft.com/zentao/8.4.1/ZenTaoPMS.8.4.1.zip
unzip -o -q /tmp/zentaopms.zip -d /opt/nginx-php/html/
rm -rf /tmp/zentaopms.zip
docker cp zentaopms.conf nginx-php:/etc/nginx/sites-enabled/zentaopms.conf
docker restart nginx-php