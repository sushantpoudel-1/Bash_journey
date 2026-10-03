#!/bin/bash 
if [  -z  "$1" ]; then 
echo " bash log_analyzer.sh <log_file> "
exit 1
fi 
file="$1" 
if [ -f "$1" ]; then 
echo " the file exists " 
error=$(grep -ic "error" "$file" ) 
warning=$(grep -ic "warning" "$file") 
echo " total error in the logs:$error"
echo " the total warning in the log:$warning "
echo " error  message in the  file is: "
echo " $(grep -i ERROR "$file" ) "
echo " the warning in the log is " 
echo " $(grep -i warning  "$file" )" 
echo " "
timestamps=$(awk '$3=="ERROR" {print $1, $2}' "$file")
echo " the timestamps for  error is " 
echo " the timestamps is :" 
echo "  $timestamps"
echo "" 
echo " the common error and warnings is :" 
echo "$(awk '$3 == "ERROR" {for(i=4; i<=NF; i++) printf "%s%s", $i, (i==NF ? ORS : OFS)}' "$file" | sort | uniq -c)"
else 
echo " the file doesnot exist " 
exit 1 
fi

