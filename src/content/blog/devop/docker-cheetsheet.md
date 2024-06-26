---
author: WeiChou
pubDatetime: 2024-05-16T00:00:00Z
modDatetime: 2024-05-16T00:00:00Z
title: The Docker cheat sheet
slug: docker-cheatsheet
featured: true
draft: false
# ogImage: https://res.cloudinary.com/noezectz/v1663745737/astro-paper/astropaper-x-forestry-og_kqfwp0.png
tags:
  - docker
description:
  The Docker cheat sheet.
---

Useful cheatsheet for managing the docker container, image and volume,.. etc.

## Manage Container

Start a container in background.
```shell
docker run -d IMAGE_NAME
```

Start an interactive container.
```shell
docker run -it IMAGE_NAME bash
```

Export port from a container.
```shell
docker run -p 80:80 -d IMAGE_NAME
```

Start a named container.
```shell
docker run --name my-app IMAGE_NAME
```

Restart a stopped container.
```shell
docker start my-app
```

Stop a container.
```shell
docker stop my-app
```

Add metadata to container.
```shell
docker run -d --label com.example.foo=bar IMAGE_NAME
```

List running containers.
```shell
docker ps
```

List all containers ( running & stopped ).
```shell
docker ps -a
```

Inspect containers metadatas.
```shell
docker inspect INSTANCE_ID
```

Remove all stopped containers.
```shell
docker rm $(docker ps --filter status=exited -q)
```

List all containers with a specific label.
```shell
docker ps --filter label=com.example.foo
```

Query a specific metadata of a running container.
```shell
docker inspect -f '{{ .NetworkSettings.IPAddress }}' INSTANCE_ID
```

## Manage Image

Build an image from Dockerfile in current directory.
```shell
docker build --tag IMAGE_NAME .
```

Force rebuild of Docker image.
```shell
docker build --no-cache .
```

Convert a container to image.
```shell
docker commit INSTANCE_ID IMAGE_NAME
```

Remove all unused images.
```shell
docker rmi $(docker images -q -f "dangling=true")
```

## Manage Volumes

Create a local volume.
```shell
docker volume create --name VOLUME_NAME
```

Mounting a volume on container start.
```shell
docker run -v VOLUME_NAME:/path/to/ IMAGE_NAME
```

Remove a volume.
```shell
docker volume rm VOLUME_NAME
```

List volumes.
```shell
docker volume ls
```

## Manage docker network

Create a local network.
```shell
docker network create NETWORK_NAME
```

Attach a container to a network on start.
```shell
docker run -d --net NETWORK_NAME IMAGE_NAME
```

Connect a running container from a network.
```shell
docker network connect NETWORK_NAME INSTANCE_ID
```

Disconnect container to a network.
```shell
docker network disconnect NETWORK_NAME INSTANCE_ID
```

## Debug the running container

Run another process in running container.
```shell
docker exec -it INSTANCE_ID bash
docker exec -it my-app bash
```

Inspect the live logs of running daemon container.
```shell
docker logs -f INSTANCE_ID
docker logs -f my-app
```

Show exposed ports of a container.
```shell
docker port INSTANCE_ID
docker port my-app
```
