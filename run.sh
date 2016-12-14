#!/bin/bash
chmod -R 755 /app
exec /usr/bin/supervisord --nodaemon -c /etc/supervisor/supervisord.conf