#!/bin/bash

find /app -type d -exec chmod 755 {} \;
find /app -type f -exec chmod 644 {} \;

exec /usr/bin/supervisord --nodaemon -c /etc/supervisor/supervisord.conf
