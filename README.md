# LEP WordPress Docker Image

## Overview

_Not meant for production._

 Linux, Nginx, PHP Docker image for WordPress Apps!

This is a repository meant to support your development environment configuration activities by supplying a LEP (Linux, Nginx, PHP) docker image. It is not meant for production but can be easily tweaked if necessary. It is based on [lep-docker](https://github.com/angelmadames/lep-docker) image.

It uses the latest version of Ubuntu. Different branches were set up to configure different versions of PHP. All images are available in [Docker Hub](https://hub.docker.com/r/solucionesgbh/lepw).

## Technical requirements

- [Docker 18.06^](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
- [Docker Compose 1.23^](https://docs.docker.com/compose/install/#install-compose)

## Example Dockerfile for your WordPress

```Dockerfile
FROM solucionesgbh/lepw:7.3

# Set the location of your theme(s)
ENV ThemePath myTheme/

# Set working directory
WORKDIR /app

# Copy your App files
COPY ..

# Copy your deploy config as local-config.php
# Note: Needs wp-config to load local-config.php
COPY config_files/local-config.php local-config.php

# Set working directory as ThemePath
WORKDIR ${ThemePath}

# Old projects might be using bower. Consider migrating from this.
# RUN bower install --allow-root --config.interactive=false

# Install Node dependencies. npm|yarn are avaialble.
RUN yarn install

# Run the app!
CMD ["/run.sh"]
```

Note: Available versions can be consulted [here](https://hub.docker.com/r/solucionesgbh/lepw/tags).

## Build

Once you have your Dockerfile ready, build it:

```bash
imageName=myApp
version=1.0

docker build -t ${imageName}:${version} .
```

In the above command, feel free to replace `imageName` and `version` to whatever fits your needs.

## Test Locally

```bash
docker container run \
  --rm \
  --name myLEPWContainerTest \
  --port 8000:80 \
  ${imageName}:${version}

# Note: Supervisor is the service configured in the image to maintain nginx and php-fpm as entrypoints.

Go to http://localhost:8000. Your WordPress site should be up and running!
```
