#!/bin/sh
if [ ! -f /config/aria2.conf ]; then
	cp /config-base/aria2.conf /config/aria2.conf
	if [ $SECRET ]; then
		echo "rpc-secret=${SECRET}" >> /config/aria2.conf
	fi
fi
if [ ! -f /config/on-complete.sh ]; then
	cp /config-base/on-complete.sh /config/on-complete.sh
fi

chmod +x /config/on-complete.sh
touch /config/aria2.session

darkhttpd /aria2-webui --port 80 &
darkhttpd /data --port 8080 &
aria2c --conf-path=/config/aria2.conf