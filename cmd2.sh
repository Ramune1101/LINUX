#!/bin/bash


SERVERLIST=/root/bin/server.list

cat << EOF > $SERVERLIST
192.168.10.10
192.168.10.20
192.168.10.30
EOF

if [ $# -eq 0 ]; then
    echo "Usage : $0 <command>"
    exit 1

fi

CMD=$*

TITLE() {
    cat << EOF
##########################
#  $1                    #
##########################
EOF

}

for IP in $(cat $SERVERLIST)

do
    TITLE $IP
    ssh $IP $CMD
    echo

done

