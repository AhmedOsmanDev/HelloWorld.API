#!/bin/bash

docker stop hello-world 2>/dev/null || true
docker rm hello-world 2>/dev/null || true

docker build -t hello-world .

docker run -d --name hello-world --restart unless-stopped \
    -p 5000:8080 \
    hello-world
