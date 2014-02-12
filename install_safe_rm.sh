#!/bin/sh

# Time-stamp: <2014-02-12 11:00:26 Wednesday by zhangguhua>

#set -x
SDIR=$(dirname $0)

if [ $# -ne 1 ]; then
    echo "Usage: $0 [install, uninstall]"
    exit 1
fi

if [ $1 = 'install' ]; then
    mv ${SDIR}/safe_rm.sh ~/.safe_rm.sh
    echo ". ~/.safe_rm.sh" >> ~/.bashrc
    crontab ${SDIR}/crontab.txt
fi

if [ $1 = 'uninstall' ]; then
    for line in `cat ${SDIR}/rm_replace.script`
    do
        echo $line
    done
fi

. ~/.bashrc
. ~/.bash_profile
