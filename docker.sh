dotnet build
docker build -t helloworld .
docker run -d --name helloworld --restart unless-stopped -p 5000:8080 helloworld
