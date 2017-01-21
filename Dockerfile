FROM alpine:3.3

MAINTAINER Tim Pouyer <tpouyer@us.ibm.com>

RUN apk update && apk add --no-cache curl bash unzip zip wget jq openjdk7-jre 

# Setup home environment
RUN adduser -S dev && mkdir -p /home/dev && chown -R dev: /home/dev && mkdir -p /home/dev/udclient

# install ucd client --- backward compatibility for now
ADD udclient /home/dev/udclient
RUN chown -R dev: /home/dev && chmod +x /home/dev/udclient/*
USER dev
ENV PATH /home/dev/udclient:$PATH
ENV JAVA_HOME /usr/lib/jvm/java-1.7-openjdk/jre/
ENV DS_WEB_URL http://192.168.27.100:8080
ENV DS_USERNAME admin
ENV DS_PASSWORD admin
