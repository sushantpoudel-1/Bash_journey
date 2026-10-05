#!/bin/bash 
if [ -z "$1" ]; then 
echo " Usage: bash website_monitor.sh <URL> "
exit 1
fi
echo " url:$1 " 
check=$(curl -s -o /dev/null -w "%{http_code}\n" "$1" )
if [ "$check" -eq 200 ]; then 
echo " status:up"
echo " status:$check"
response_time=$(curl -s -o /dev/null -w "%{time_total}\n" "$1")
echo " response-time:$response_time"
else
echo "  status:down"
echo "status-code:$check"
echo " response-time:$response_time"
fi

