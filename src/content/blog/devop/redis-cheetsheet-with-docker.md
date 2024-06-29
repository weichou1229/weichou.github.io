---
author: WeiChou
pubDatetime: 2023-08-11T00:00:00Z
modDatetime: 2023-08-11T00:00:00Z
title: The Redis cheat sheet with Docker
slug: redis-cheatsheet-with-docker
featured: true
draft: false
tags:
  - redis
  - docker
description:
  The Cheat Sheet for running the Redis with docker.
---

## Table of contents

## Deploy a Redis with docker
```
docker run -d --rm --name redis -p 6379:6379 -d redis:7.2.5-alpine3.20
```

## Redis Pub/Sub
Subscribe the channel with the docker command, for example, subscribe channel by matching a given pattern.
```
docker exec -it redis redis-cli PSUBSCRIBE news.*
```

```
docker exec -it redis redis-cli PUBLISH news.financial '{"date":1719656405,"body":{...}}'


Refer to https://redis.io/docs/latest/develop/interact/pubsub/.