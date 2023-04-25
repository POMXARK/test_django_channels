#!/bin/bash
rm -rf /etc/nginx/sites-enabled/default
mv -f nginx/conf.d/* /etc/nginx/conf.d/
mv -f supervisor/conf.d/* /etc/supervisor/conf.d/
cd ..
mkdir /run/daphne/
mkdir /app/log/nginx
touch access.log error.log
nginx -t
service nginx start
service nginx reload
ps aux | grep nginx
#touch /var/run/supervisor.sock
#chmod 777 /var/run/supervisor.sock
#whereis gunicorn
service supervisor start
supervisorctl status
#supervisorctl update
#supervisorctl reread
redis-server
#redis-server &
#daphne -e ssl:443:privateKey=cert.key:certKey=cert.crt test_django_channels.asgi:application  -b 0.0.0.0 -p 8080


