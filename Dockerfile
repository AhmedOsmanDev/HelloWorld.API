FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

RUN dotnet build
RUN dotnet dev-certs https -ep /https/HelloWorld.API.pfx -p 1811

FROM mcr.microsoft.com/dotnet/aspnet:8.0

WORKDIR /app

COPY --from=build /bin/Debug/net8.0/ .
COPY --from=build /https/HelloWorld.API.pfx /https/HelloWorld.API.pfx

EXPOSE 80
EXPOSE 443

ENTRYPOINT [ "dotnet", "HelloWorld.API.dll" ]
