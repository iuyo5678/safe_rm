#!/bin/sh

# Time-stamp: <2014-02-12 13:56:57 Wednesday by zhangguhua>

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
    name=". ~/.safe_rm.sh"
    confirm2='N'
    read -p "clear sure uninstall safe_rm ?[n]" confirm1
    [ $confirm1 == 'y' ] || [ $confirm1 == 'Y' ]  && /bin/rm -rf ~/.safe_rm.sh
    [ $confirm1 == 'y' ] || [ $confirm1 == 'Y' ]  && grep -v "$name" ~/.bashrc > ~/.temp.temp && mv ~/.temp.temp ~/.bashrc
    [ $confirm1 == 'y' ] || [ $confirm1 == 'Y' ]  && read -p "clear sure remove the trash folder ,maybe lost file?[n]" confirm2
    [ $confirm2 == 'y' ] || [ $confirm2 == 'Y' ]  && /bin/rm -rf ~/.trash
fi

