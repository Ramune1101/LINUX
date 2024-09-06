#!/bin/bash

PKG_TELNET="telnet telnet-server"
SVC_TELNET="telnet.socket"
FW_telnet="telnet"

PKG_FTP="vsftpd ftp"
CONF_FTP_USER=/etc/vsftpd/ftpusers
CONF_FTP_USERLIST=/etc/vsftpd/user_list
SVC_FTP="vsftpd.service"
FW_FTP="ftp"





CONF_BASHRC=$HOME/bashrc.txt
CONF_BASHRC_TMP=/root/tools/bashrc.template


FWCMD() {
    firewall-cmd --permanent "$*"
    firewall-cmd --reload
}

function print_good () {
    echo -e "\x1B[01;32m[+]\x1B[0m $1"
}

function print_error () {
    echo -e "\x1B[01;31m[-]\x1B[0m $1"
}

function print_info () {
    echo -e "\x1B[01;34m[*]\x1B[0m $1"
}


