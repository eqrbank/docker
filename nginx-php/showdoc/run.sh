#!/usr/bin/env bash

curl -o /tmp/showdoc.zip https://codeload.github.com/star7th/showdoc/zip/v1.2.6
unzip -o -q /tmp/showdoc.zip -d /var/lib/docker/volumes/nginx/_data/
rm -rf /tmp/showdoc.zip
mv /var/lib/docker/volumes/nginx/_data/showdoc-* /var/lib/docker/volumes/nginx/_data/showdoc
docker cp showdoc.conf nginx-php:/etc/nginx/sites-enabled/showdoc.conf
docker restart nginx-php