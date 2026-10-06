#!/bin/bash
if [ -z "$#" ]; then
echo "Usage: bash web_monitor.sh <URL>"
exit 1
fi

for url in "$@" 
do
#!/bin/bash

if [ -z "$#" ]; then
    echo "Usage: bash web_monitor.sh <URL> [URL2] [URL3] ..."
    exit 1
fi
total=0
up=0
down=0
slow=0
log="web_monitor.log"
for url in "$@"
do
  total=$((total + 1))
  echo "URL: $url"
  check=$(curl -s -o /dev/null -w "%{http_code}" "$url")
  response_time=$(curl -s -o /dev/null -w "%{time_total}" "$url")
 if [ "$check" -ge 200 ] && [ "$check" -le 399 ]; then
        echo "Status: UP"
  up=$((up + 1))
 echo "$(date '+%Y-%m-%d %H:%M:%S') - $url - UP - $check - ${response_time}s" >> "$log"
else
 echo "Status: DOWN"
  down=$((down + 1))
 echo "$(date '+%Y-%m-%d %H:%M:%S') - $url - DOWN - $check - ${response_time}s" >> "$log"
    fi
   echo "Status code: $check"
echo "Response time: $response_time seconds"
 if awk "BEGIN {exit !($response_time > 2)}"; then
echo "WARNING: Website is responding slowly"
slow=$((slow + 1))
 else
echo "Website response time is normal"
 fi
done
echo "Total websites : $total"
echo "Websites UP    : $up"
echo "Websites DOWN  : $down"
echo "Slow websites  : $slow"

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
if awk "BEGIN {exit !($response_time > 2)}"; then
    echo "WARNING: it is taking a long time"
else
    echo "Website working properly"
fi
log="web_monitor.log"
if [ "$check" -ge 200 ] && [ "$check" -le 399 ]; then
echo "$(date '+%Y-%m-%d %H:%M:%S') - $url - UP - $check - ${response_time}s" >> "$log"
else
echo "$(date '+%Y-%m-%d %H:%M:%S') - $url - DOWN - $check - ${response_time}s" >> "$log"
fi
done
 

