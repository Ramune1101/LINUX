#!/bin/bash

SERVER=172.16.6.250

CMD() {
	sleep 2; echo 'root'
	sleep 1; echo 'centos'
    sleep 0.5; echo "hostname"
	sleep 2; echo 'tar cvzf /tmp/linux222.tar.gz /home'
	sleep 2; echo 'exit'
}
CMD | telnet $SERVER

ftp -n $SERVER << EOF
    user root centos
    cd /tmp
    lcd /root
    bin
    hash
    prompt
    mget linux222.tar.gz
    quit
EOF
