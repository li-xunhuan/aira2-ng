FROM alpine:latest

MAINTAINER wjg1101766085 <1101766085@qq.com>

RUN apk update && \
	apk add --no-cache --update bash && \
	mkdir -p /config && \
	mkdir -p /config-base && \
	mkdir -p /data && \
	apk add --no-cache --update aria2 && \
	apk add --update darkhttpd

ADD files/start.sh /config-base/start.sh
ADD files/aria2.conf /config-base/aria2.conf
ADD files/on-complete.sh /config-base/on-complete.sh
ADD files/web /aria2-webui

RUN chmod +x /config-base/start.sh

WORKDIR /
VOLUME ["/data"]
VOLUME ["/config"]
EXPOSE 6800
EXPOSE 80
EXPOSE 8080

CMD ["/config-base/start.sh"]
