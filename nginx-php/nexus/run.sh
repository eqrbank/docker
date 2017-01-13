#!/usr/bin/env bash

docker cp nexus.conf nginx-php:/etc/nginx/sites-enabled/nexus.conf
docker exec nginx-php nginx -s reload