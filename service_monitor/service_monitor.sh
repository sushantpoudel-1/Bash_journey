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
check=$(systemctl is-active "$service" )
if [ "$check" == "active" ]; then
echo "service:$service"
echo "status:$check"
else 
echo "service:$service"
echo "status:$check"
fi


