# lep-wp-docker
Linux Nginx PHP docker image for wordpress

*NOT FOR PRODUCTION*

## How to use (Sample Dockerfile)
```
FROM solucionesgbh/lepw:latest

# Delete sample app
RUN rm -fr /app/*

# Copy our app into the app folder
COPY . /app

# Copy our deploy config as local-config.php (needs wp-config to load local-config.php)
COPY .deploy/wp-config.php /app/local-config.php

# Bower install
RUN cd /app/<<path to theme>> && bower install --allow-root --config.interactive=false && npm install

# NPM install
RUN cd /app/<<path to theme>> && npm install

# Run our command (it runs chmod -R 777 on /app folder)
CMD ["/run.sh"]
```