#!/bin/bash
SERVERLIST=/root/bin/server.txt
FILE=linux222.txt

for ip in $(cat $SERVERLIST)
do

    ftp -n "$ip" 21 << EOF
    user root centos
    cd /tmp
    lcd /test
    bin
    hash
    prompt
    mput $FILE
    quit
EOF

done

