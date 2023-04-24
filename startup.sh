#!/bin/bash
redis-server &
daphne test_django_channels.asgi:application -b 0.0.0.0 -p 8080
