#!/bin/bash
if [ -z "$1" ]; then 
echo "Usage: bash log_archive.sh <log_directory>"
exit 1 
fi 
if [ -d "$1" ]; then 
echo "directory exist " 
else
echo " error:directory  doesnt exist "
exit 1
fi 
file_old=$(find  "$1" -type f -mtime +7)
echo " the old files are $file_old" 
date=$(date +"%Y-%m-%d_%H-%M-%S")
archive="log_archives_$date.tar.gz"
tar -czvf "$archive" $file_old  
status="$?" 
if [ "$status" -eq  0 ]; then 
echo " files sucessfuly archived " 
else 
echo " file couldnt be archived " 
exit 1 
fi 

