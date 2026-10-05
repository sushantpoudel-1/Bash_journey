#!/bin/bash

temp=$(mktemp -d)

touch "$temp"/file1.txt
touch "$temp"/file2.txt
touch "$temp"/file3.txt
echo " the temp directory is : $temp" 
echo " this contains data for file manxe ho manxe this is ffor human " > "$temp"/file1.txt
echo " this contains data for file 2 this is for animal  " > "$temp"/file2.txt
echo " this contains data for file 3" > "$temp"/file3.txt
total_files=$(ls "$temp" | wc -l)
echo "the total files in the directory: $total_files"
find=$(grep -l "animal" "$temp"/* | wc -l)
echo "the total files containing animal: $find"
