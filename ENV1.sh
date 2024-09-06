#!/bin/bash -e

# 1. telnet 서비스
# 2. vsftpd 서비스

source /root/bin/func.sh

# 1. telnet 서비스
# -1. 패키지 설치
# -2. 서비스 설정
# -3. 서비스 기동
# -4. 방화벽 등록

echo "[ INFO ] Start telnet service"


# -1. 패키지 설치

yum -q install $PKG_TELNET
echo "[ Ok ] 패키지 설치: $PKG_TELNET"

# -2. 서비스 설정

# -3. 서비스 기동

systemctl enable --now $SVC_TELNET
echo "[ Ok ] 서비스 기동: $SVC_TELNET"

# -4. 방화벽 등록
FWCMD --add-service=$FW_telnet
echo "[ Ok ] 방화벽 등록: $FW_telnet"
echo "[ INFO ] End for telent"

echo

echo "[ INFO ] Start for FTP"

# 1. telnet 서비스
# -1. 패키지 설치
yum -q install $PKG_FTP
echo "[ Ok ] success for download FTP"




# -2. 서비스 설정

sed -i 's/^root//' $CONF_FTP_USER
sed -i 's/^root//' $CONF_FTP_USERLIST
echo "[ Ok ] success for FTP setting"





# -3. 서비스 기동

systemctl enable --now $SVC_FTP
echo "[ Ok ] 서비스 기동: $SVC_FTP"

# -4. 방화벽 등록

FWCMD --add-service=$FW_FTP
echo "[ Ok ] 방화벽 등록: $FW_FTP"
echo "[ INFO ] End for FTP"


