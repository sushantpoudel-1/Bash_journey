#!/bin/bash 
if [ -z "$1" ] || [ -z "$2" ]; then 
echo " enter in log_directory and disk -usage "
exit 1
fi 
if [ -d "$1" ]; then 
echo " the directory exist "
else 
echo " the directory doesnt exists"
exit 1
fi 
disk_usage=$(df -h | awk ' $6=="/" awk{print $5} ' | cut -d "%" -f1 )
if [ "$disk_usage" -gt  "$2" ]; then 
echo " disk is not  normal" 
else
echo " disk is normal " 
fi

old_files=$(find "$1"/  -type f -mtime +7)
total_files=$(find "$1"/ -type f -mtime +7 | wc -l )
echo " the total files  : $total_files" 
echo " the files are $old_files"
date=$(date "+%-Y-%m-%d_%H-%M-%S")
mkdir -p backups/
filename="backups/backup_"$date".tar.gz"
tar -czf "$filename" $old_files

