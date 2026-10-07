 if [ -z  "$1" ]; then 
echo " enter the file name"
exit 1 
fi 
if [ -f "$1" ]; then 
echo " the file exist" 
total_lines=$( cat "$1" | wc -l )
echo " the file name is : $1 " 
echo " total line in the file is :$total_lines" 
else 
echo " the file doesnt exist " 
exit 1
fi
