#!/bin/bash

cat << EOF > $SERVERLIST
192.168.10.10
192.168.10.20
192.168.10.30
EOF

if [ $# -eq 0 ]; then
    echo "Usage : $0 <src><dst>"
    exit 1

fi
SRC=$1
DST=$2

TITLE() {
    cat << EOF
##########################
#  $1                    #
##########################
EOF

}


SERVERLIST=/root/bin/server.list

for IP in $(cat $SERVERLIST)
do
TITLE $IP
    scp $SRC $IP: $DST
    echo
done


