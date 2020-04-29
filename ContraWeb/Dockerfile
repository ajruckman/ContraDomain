## Build
#
#FROM golang:1.14.2 AS build-env
#
#RUN mkdir -p /opt/
#
#COPY build.sh /opt/
#COPY Corefile /opt/
#
#RUN /bin/bash /opt/build.sh
#
## Run
#
#FROM ubuntu:eoan
#
#COPY --from=build-env /opt/coredns/coredns /opt/coredns
#COPY Corefile /opt/
#COPY wait-for-it.sh /opt/wait-for-it.sh
#
#EXPOSE 53/tcp
#EXPOSE 53/udp
#
#CMD /opt/coredns -conf /opt/Corefile

# Build

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env

RUN mkdir -p /app/

COPY build.sh /app/

RUN /bin/bash /app/build.sh

# Run

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim

COPY --from=build-env /opt/contraweb/Web/bin/Docker/netcoreapp3.1/publish/ /app/

WORKDIR /app/

EXPOSE 80/tcp

ENTRYPOINT ["dotnet", "Web.dll"]

#FROM mcr.microsoft.com/dotnet/core/aspnet:3.1.3-buster-slim
