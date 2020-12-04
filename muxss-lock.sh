#!/bin/sh

ps -aux | grep slock | grep -v grep | grep -v "xss-lock" &> /dev/null

if [ $? -ne 0 ]
then
    slock
fi
