#!/bin/bash 
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
else 
echo "service:$service"
systemctl restart "$service"
status="$?"
if [ "$status" -eq 0 ]; then
    echo "Service successfully restarted"
else
    echo "Failed to restart service"
    exit 1
fi
fi
