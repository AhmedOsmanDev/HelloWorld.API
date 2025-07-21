FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY bin/Debug/net8.0/ .
EXPOSE 5000
ENTRYPOINT [ "dotnet", "HelloWorld.API.dll" ]
