---
author: WeiChou
pubDatetime: 2024-06-01T00:00:00Z
modDatetime: 2024-06-01T00:00:00Z
title: Docker | Run Container with the Crontab
slug: docker-run-container-with-crontab
featured: true
draft: false
# ogImage: https://res.cloudinary.com/noezectz/v1663745737/astro-paper/astropaper-x-forestry-og_kqfwp0.png
tags:
  - docker
description:
  An example to run the docker container with the crontab
---

Introduce an example to run the docker container with the crontab.

## Create a Python Hello World example
Create the python file `main.py` which contains below example.
```
if __name__ == '__main__':
    print("Hello World!")
```

## Create the Contab file
Create a contab file `my-contab` for running our code
```
* * * * * cd /app && python main.py
```

## Create the docker file

```
FROM python:3.12-alpine

COPY . /app
WORKDIR /app

# make sure all messages always reach console
ENV PYTHONUNBUFFERED=1

RUN crontab ./my-cronjob

CMD ["/bin/sh"]
```

## Build Dcoker image
```
docker build . -t cron-test
```

## Run Docker container
```
docker run -d --name=my-cron-test cron-test crond -f -d 8
```

Check whether the cron job works by the command `docker logs my-cron-test -f`.
```
docker logs my-cron-test -f
crond: crond (busybox 1.36.1) started, log level 8
crond: USER root pid   7 cmd cd /app && python main.py
Hello World!!
crond: USER root pid   8 cmd cd /app && python main.py
Hello World!!
```

## [Optional] Run Docker container by docker-compose
Create the docker-compose file.
```
services:
  my-cron-test:
    image:  cron-test
    container_name: my-cron-test
    command: crond -f -d 8
```

Run docker container.
```
docker compose up -d
```
