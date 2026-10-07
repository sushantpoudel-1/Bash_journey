#!/bin/bash 
 date=$(date "+%Y-%m-%d_%H_%M_%S")
log_report="report.log"
if [ -z "$1" ]; then 
echo "  enter a directory " 
exit 1 
fi 
if [ -d "$1" ]; then 
echo " the directory exist " 
check=$(find "$1" -type f -mtime +7  )
check2=$(find "$1" -type f -mtime +7 | wc -l )
echo " totalt file older than 7 days is:$check2  " 
echo " the files that are older that 7 days are : $check " 
if [ "$check2" -eq 0 ]; then 
echo " there are no old files " 
else 
archive="log_archive_$date.tar.gz"
tar -czvf "$archive" $check 
status="$?"
if [ "$status" -eq 0 ]; then 
echo " archive creation suceed"
echo " $date-archive creation sucessful">>report.log
echo " $date-archive old file remove ">>report.log 
rm  -rf $check
else 
echo " archive creation failed "

fi 
fi 


else
echo " the directory doesnt exist  " 
exit 1 
fi 
