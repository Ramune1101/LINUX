#!/bin/bash

USERLIST=/root/tools/user.list
> $USERLIST

for i in $(seq 1 100)
do
    echo $i
done