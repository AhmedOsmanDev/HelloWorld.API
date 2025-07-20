FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY bin/Debug/net8.0/HelloWorld.API.runtimeconfig.json HelloWorld.API.runtimeconfig.json
COPY bin/Debug/net8.0/*.dll .
EXPOSE 5000
ENTRYPOINT [ "dotnet", "HelloWorld.API.dll" ]
