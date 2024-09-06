#!/bin/bash -e

source /root/bin/func.sh

echo 
echo "[ INFO ] Start For setting For File system"
/bin/cp -p  $CONF_BASHRC_TMP  $CONF_BASHRC
echo "[ Ok ] setting File system"
echo "[ INFO ] END For setting File"

