#!/bin/bash
if [ -z "$1" ]; then 
echo "Usage: bash log_archive.sh <log_directory>"
exit 1 
fi 
if [ -d "$1" ]; then 
echo "directory exist " 
else
echo " error:directory  doesnt exist "
fi 
file_old=$(find  "$1" -type f -mtime +7)
echo " the old files are $file_old" 
