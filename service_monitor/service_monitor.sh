#!/bin/bash 
log="service_monitor.log"
service="$1" 
 if [ -z "$service" ]; then 
echo " enter a valid  service " 
exit 1
fi
if systemctl list-unit-files --type=service | grep -q "$service.service"; then
    echo "Service exists"
else
    echo "Service does not exist"
exit 1
fi 
echo "" 
echo ""
check=$(systemctl is-active "$service" )
if [ "$check" == "active" ]; then
echo "service:$service"
echo ""
echo "status:$check"
echo " $(date)-$service is running ">>"$log" 
else 
echo "$(date '+%Y-%m-%d %H:%M:%S') - $service is down" >> "$log"
echo "service:$service"
echo " restarting service " 
systemctl restart "$service"
status="$?"
if [ "$status" -eq 0 ]; then
    echo "Service successfully restarted"
echo "$(date '+%Y-%m-%d %H:%M:%S') - $service sucessfully started"  >> "$log"
else
    echo "Failed to restart service"
echo "$(date '+%Y-%m-%d %H:%M:%S') - $service failed to restart" >> "$log"
    exit 1
fi
fi
