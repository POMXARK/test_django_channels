#!/bin/bash
rm -rf /etc/nginx/sites-enabled/default
mv -f nginx/conf.d/* /etc/nginx/conf.d/
cd ..
mkdir /app/log/nginx
touch access.log error.log
nginx -t
service nginx start
service nginx reload
ps aux | grep nginx
redis-server &
cd /app
daphne test_django_channels.asgi:application -b 0.0.0.0 -p 8000