#!/bin/bash

set -e

#1. 패키지 설치
# - httpd, mod_ssl
# - epel - release
# - boxes, cowsay

#2. 서비스 설정
# /var/www/html/index.html

#3. 서비스 기동
# - systemctl restart httpd
# - systemctl enable httpd



#1. 패키지 설치
# - httpd, mod_ssl
# - epel - release
# - boxes, cowsay
echo "[시작] 1. 패키지 설치"
dnf -y -q install httpd mod_ssl epel-release
dnf -y -q install boxes cowsay
echo "[완료] 1. 패키지 설치"



#2. 서비스 설정
# /var/www/html/index.html
echo "[시작] 2. 서비스 설정"

echo "
Welcome To My Server  
- Apache httpd
" | boxes -d whirly >/var/www/html/index.html

echo "[완료] 2. 서비스 설정"



#3. 서비스 기동
# - systemctl restart httpd
# - systemctl enable httpd

echo "[시작] 3. 서비스 기동"

systemctl restart httpd >/dev/null 2>&1
systemctl enable httpd >/dev/null 2>&1

echo "[완료] 3. 서비스 기동"

