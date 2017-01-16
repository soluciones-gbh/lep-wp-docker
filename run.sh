#!/bin/bash
chmod -R 777 /app
exec /usr/bin/supervisord --nodaemon -c /etc/supervisor/supervisord.conf