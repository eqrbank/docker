#!/usr/bin/env bash

curl -o /tmp/phpmyadmin.zip https://files.phpmyadmin.net/phpMyAdmin/4.6.5.2/phpMyAdmin-4.6.5.2-all-languages.zip
unzip -o -q /tmp/phpmyadmin.zip -d /var/lib/docker/volumes/nginx/_data/
rm -rf /tmp/phpmyadmin.zip
mv /var/lib/docker/volumes/nginx/_data/phpMyAdmin-* /var/lib/docker/volumes/nginx/_data/vhost_phpMyAdmin
docker cp phpmyadmin.conf nginx-php:/etc/nginx/sites-enabled/phpmyadmin.conf
docker restart nginx-php