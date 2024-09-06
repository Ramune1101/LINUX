#!/bin/bash

set -e

#1. 패키지 설치
# - nginx
# - epel - release
# - boxes, cowsay

#2. 서비스 설정
# /usr/share/nginx/html/index.html

#3. 서비스 기동
# - systemctl restart nginx
# - systemctl enable nginx



#1. 패키지 설치
# - nginx
# - epel - release
# - boxes, cowsay
echo "[시작] 1. 패키지 설치"
dnf -y -q install nginx
dnf -y -q install boxes cowsay
echo "[완료] 1. 패키지 설치"



#2. 서비스 설정
# /usr/share/nginx/html/index.html
echo "[시작] 2. 서비스 설정"

echo "
Welcome To My Server  
- Apache nginx
" | boxes -d whirly >/usr/share/nginx/html/index.html

echo "[완료] 2. 서비스 설정"



#3. 서비스 기동
# - systemctl restart nginx
# - systemctl enable nginx

echo "[시작] 3. 서비스 기동"

systemctl enable nginx >/dev/null 2>&1
systemctl restart nginx >/dev/null 2>&1

echo "[완료] 3. 서비스 기동"

