#!/usr/bin/env bash

curl -o /tmp/showdoc.zip https://codeload.github.com/star7th/showdoc/zip/v1.2.4
unzip -o -q /tmp/showdoc.zip -d /opt/nginx-php/html/
rm -rf /tmp/showdoc.zip
mv showdoc-* showdoc
docker cp showdoc.conf nginx-php:/etc/nginx/sites-enabled/showdoc.conf
docker restart nginx-php