#!/bin/bash

dotnet build

docker stop hello-world 2>/dev/null || true
docker rm hello-world 2>/dev/null || true

docker build -t hello-world .

docker run -d --name hello-world --restart unless-stopped \
    -p 80:80 \
    -p 443:443 \
    hello-world

echo ""
echo "✓ HelloWorld.API deployed successfully!"
echo ""
echo "Local access:"
echo "    HTTP:  http://localhost"
echo "    HTTPS: https://localhost"
echo ""
