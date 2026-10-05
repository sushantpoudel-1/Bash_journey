#!/bin/bash 
temp=$(mktemp -d) 
touch "$temp"/file1.txt
touch "$temp"/file2.txt
touch "$temp"/file3.txt
echo " this contains data for file " > "$temp"/file1.txt
echo " this contains data for file 2 " > "$temp"/file2.txt
echo " this contains data for file 3" > "$temp"/file3.txt
total_file=$(ls "$temp" | wc )
echo " the totalt no of file is : $total_file"
 

