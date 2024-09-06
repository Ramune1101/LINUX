#!/bin/bash

server2=192.168.10.30
server3=192.168.10.10

pingtestserver2=$(ping $server2 -c 1 2>&1)
pingtestserver3=$(ping $server3 -c 1 2>&1)

if echo "$pingtestserver2" | grep -q "Destination Host Unreachable"; then
    echo "server2 is down"

else
        echo "server2 is up"
        CMD | telnet 

fi



if echo "$pingtestserver3" | grep -q "Destination Host Unreachable"; then
    echo "server3 is down"
else
        echo "server3 is up"
        CMD | telnet

fi


CMD() {
    sleep 2; echo "root"
    sleep 1; echo "centos"
    sleep 1; echo "shutdown -r now"
    sleep 1; exit
}

