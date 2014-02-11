#!/bin/sh

# Time-stamp: <2014-02-11 15:49:30 Tuesday by zhangguhua>
#set -x
SDIR=$(dirname $0)

if [ $# -ne 1 ]; then
    echo "Usage: $0 [install, unstall]"
    exit 1
fi

if [ $1 = 'install' ]; then
    cat ${SDIR}/rm_replace.script >> ~/.bashrc
    crontab ${SDIR}/crontab.txt
fi

if [ $1 = 'uninstall' ]; then
    unalias rm
    unalias r  
    unalias rl
    unalias ur
fi

. ~/.bashrc
. ~/.bash_profile
