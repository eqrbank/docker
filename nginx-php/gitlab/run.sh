#!/usr/bin/env bash

docker cp gitlab.conf nginx-php:/etc/nginx/sites-enabled/gitlab.conf
docker exec nginx-php nginx -s reload