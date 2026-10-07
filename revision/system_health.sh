#!/bin/bash

date=$(date "+%Y-%m-%d_%H-%M-%S")
log="report.log"

if [ -z "$1" ]; then
echo " enter the optimal threshold "
exit 1
fi

mem_usage=$(free -h | awk '/Mem:/{ print $3 }')
echo " total mem :$mem_usage"
echo " $date -mem usage:$mem_usage" >>"$log"

disk_usage=$(df -h / | awk 'NR==2 {print $5}' | cut -d'%' -f1)
echo " total disk usage is:$disk_usage%"
echo " $date - disk usage:$disk_usage%" >> "$log"

system_up=$(uptime -p)
echo " system uptime :$system_up"
echo " $date - uptime :$system_up " >> "$log"

total_process=$(ps -e | wc -l)
echo " process running:$total_process"
echo " $date - total process:$total_process" >>"$log"

current_time=$(date)
echo " the current time is : $current_time "

hostname=$(hostname)
echo " the hostname is : $hostname "

if [ "$disk_usage" -gt "$1" ]; then
echo " warning high disk usage "
echo " $date - warning high disk usage " >>"$log"
else
echo " disk is normal "
echo " $date - disk usage is normal " >>"$log"
fi
