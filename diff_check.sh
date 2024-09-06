#!/bin/bash

tmp1=/tmp/tmp1
tmp2=/tmp/tmp2
tmp3=/tmp/tmp


systemctl -t service \
    | awk '{print $1, $3}' \
	| sed -n '2,/LOAD/p' \
	| sed '$d' > $tmp1


ssh 192.168.10.30 \
systemctl -t service \
    | awk '{print $1, $3}' \
	| sed -n '2,/LOAD/p' \
	| sed '$d' > $tmp2


diff $tmp1 $tmp2 > $tmp3

echo "server1에만 존재하는것들"
cat $tmp3 | fgrep '<'

echo "server2에만 존재하는것들"
cat $tmp3 | fgrep '>'

