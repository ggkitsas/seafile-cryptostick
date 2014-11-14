#!/bin/sh

cd ~/.ccnet/logs

if [ $1 = "ccnet" ]; then
    echo "***********************CCNET LOG*****************************"
    cat ccnet.log
elif [ $1 = "applet" ]; then
    echo "***********************APPLET LOG*****************************"
    cat applet.log 
elif [ $1 = "seafile" ]; then
    echo "***********************SEAFILE LOG*****************************"
    cat seafile.log
else
    echo "***********************CCNET LOG*****************************"
    cat ccnet.log
    echo "***********************SEAFILE LOG*****************************"
    cat seafile.log
    echo "***********************APPLET LOG*****************************"
    cat applet.log 
fi


