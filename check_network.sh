#!/bin/bash

source /root/bin/func.sh

#1. 로컬 IP 테스트
print_info "ping 192.168.10.2"
IP1=192.168.10.2

ping -c 1 -W 1 $IP1 >/dev/null 2>&1

if [ $? -eq 0 ]; then
        print_good "[ OK ] Local Network Connection"

    else    
        print_good "[ FAIL] Local Network Connection"

        cat <<EOF
        (ㄱ) VMware >  Edit > Virtual Network Editor
        (ㄴ) VMware > VM > Settings > Network Adapter
        (ㄷ) # ifconfig 
EOF
fi



#2. 외부 IP 테스트

print_info "ping 8.8.8.8"
IP2=8.8.8.8

ping -c 1 -W 1 $IP2 >/dev/null 2>&1

if [ $? -eq 0 ]; then
        print_good "[ OK ] External Network Connection"

    else    
        print_good "[ FAIL] External Network Connection"
        cat << EOF
         (ㄱ) # ip route
EOF
fi


#3. 외부 이름으로  테스트


print_info "ping www.google.com"
IP3=www.google.com

ping -c 1 -W 1 $IP3 >/dev/null 2>&1

if [ $? -eq 0 ]; then
        print_good "[ OK ] DNS Client Configuration"

    else    
        print_good "[ FAIL] DNS Client Configuration"
        cat << EOF
         (ㄱ) # cat /etc/resolv.conf
EOF
fi

