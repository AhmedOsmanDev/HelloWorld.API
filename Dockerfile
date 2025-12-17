FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

RUN mkdir -p /https
RUN dotnet dev-certs https -ep /https/hello-world.pfx -p 1811

FROM mcr.microsoft.com/dotnet/aspnet:8.0

WORKDIR /app

COPY bin/Debug/net8.0/ .
COPY --from=build /https/hello-world.pfx /https/hello-world.pfx

EXPOSE 80
EXPOSE 443

ENTRYPOINT [ "dotnet", "HelloWorld.API.dll" ]
