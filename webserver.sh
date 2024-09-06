#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage:$0<httpd|nginx>"
    exit 1

    
fi 

WEBTYPE=$1

HTTPD() {
    systemstatusNginx=$(systemctl is-active nginx)
    if [ "$systemstatusNginx" = "active" ]; then
        systemctl stop nginx
        echo "nginx is down now"
    fi 

    /root/bin/httpd.sh
    echo "성공적으로 완료"
  
}


NGINX() {
    systemstatushttpd=$(systemctl is-active httpd)
    if [ "$systemstatushttpd" = "active" ]; then
        systemctl stop httpd
        echo "httpd is down now"
    fi 

    /root/bin/nginx.sh
    echo "성공적으로 완료"
  
}


ERROR() {
    echo "$WEBTYPE is httpd or nginx"
    exit 2
}


case $WEBTYPE in
    'httpd') HTTPD ;;
    'nginx') NGINX ;;
    *) ERROR ;;

esac