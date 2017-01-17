#!/usr/bin/env bash

docker cp vanke.conf nginx-php:/etc/nginx/sites-enabled/vanke.conf
docker exec nginx-php nginx -s reload