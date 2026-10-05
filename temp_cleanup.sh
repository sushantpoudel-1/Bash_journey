#!/bin/bash
temp_log="tempcleanup.log"
temp=$(mktemp -d)
echo " $(date '+%Y-%m-%d  %H-%M-%S')-temporary directory  created " >>"temp_log"

touch "$temp"/file1.txt
touch "$temp"/file2.txt
touch "$temp"/file3.txt
echo " $(date '+%y-%m-%d  %H-%M-%S')-temporary file created " >>"temp_log"
echo " the temp directory is : $temp" 
echo " this contains data for file manxe ho manxe this is ffor human " > "$temp"/file1.txt
echo " this contains data for file 2 this is for animal  " > "$temp"/file2.txt
echo " this contains data for file 3" > "$temp"/file3.txt
total_files=$(ls "$temp" | wc -l)
echo "the total files in the directory: $total_files"
find=$(grep -l "animal" "$temp"/* | wc -l)
echo "the total files containing animal: $find"
echo " $(date '+%y-%m-%d  %H-%M-%S')- basic work done  " >> "temp_log"
cleanup(){
echo " $(date '+%y-%m-%d  %H-%M-%S')-temporary file being cleaned up  " >> "temp_log"
rm -rf "$temp" 

echo " $(date '+%y-%m-%d  %H-%M-%S')-temorary filed cleaned up " >> "temp_log"
} 
trap cleanup EXIT
sleep 30 

