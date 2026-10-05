#!/bin/bash 
if [ -z "$1" ]; then 
echo " Usage: bash website_monitor.sh <URL> "
exit 1
fi
echo " url:$1 " 
check=$(curl -s -o /dev/null/ -w "%{http_code}\n" "$1" )
if [ "$check" -eq 200 ]; then 
echo " status:up"
fi 

