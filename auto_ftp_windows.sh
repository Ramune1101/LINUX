#!/bin/bash

WINSERVER=192.168.10.128
PORT=21

ftp -n $WINSERVER << EOF
user user01 user01
cd test
lcd /test
bin
hash
prompt
mput linux222.txt
quit
EOF

