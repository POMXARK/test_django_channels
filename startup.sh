#!/bin/bash
daphne -e ssl:443:privateKey=cert.key:certKey=cert.crt test_django_channels.asgi:application  -b 0.0.0.0 -p 8080 &
redis-server

