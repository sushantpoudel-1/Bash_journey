#!/bin/bash
if [ -z "$#" ]; then
echo "Usage: bash web_monitor.sh <URL>"
exit 1
fi

for url in "$@" 
do
echo "URL: $url"
check=$(curl -s -o /dev/null -w "%{http_code}" "$url")
response_time=$(curl -s -o /dev/null -w "%{time_total}" "$url")
if [ "$check" -ge 200 ] && [ "$check" -le 399 ]; then
echo "Status: UP"
 
else
echo "Status: DOWN"
fi
echo "Status code: $check"
echo "Response time: $response_time seconds"
echo ""
log="web_monitor.log"
if [ "$check" -ge 200 ] && [ "$check" -le 399 ]; then
echo "$(date '+%Y-%m-%d %H:%M:%S') - $url - UP - $check - ${response_time}s" >> "$log"
else
echo "$(date '+%Y-%m-%d %H:%M:%S') - $url - DOWN - $check - ${response_time}s" >> "$log"
fi
done 

