#!/bin/sh

# Time-stamp: <2014-02-12 11:54:13 Wednesday by zhangguhua>

#set -x
SDIR=$(dirname $0)

if [ $# -ne 1 ]; then
    echo "Usage: $0 [install, uninstall]"
    exit 1
fi

if [ $1 = 'install' ]; then
    cp ${SDIR}/safe_rm.sh ~/.safe_rm.sh
    echo ". ~/.safe_rm.sh" >> ~/.bashrc
    crontab ${SDIR}/crontab.txt
    . ~/.bashrc
    . ~/.bash_profile
fi

if [ $1 = 'uninstall' ]; then
    read -p "clear sure?[n]" confirm
    name=". ~/.safe_rm.sh"
    [ $confirm == 'y' ] || [ $confirm == 'Y' ]  && /bin/rm -rf ~/.trash ~/.safe_rm.sh
    [ $confirm == 'y' ] || [ $confirm == 'Y' ]  && grep -v "$name" ~/.bashrc > ~/.temp.temp && mv ~/.temp.temp ~/.bashrc
fi

