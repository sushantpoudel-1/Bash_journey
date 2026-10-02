#!/bin/bash

if [ -z "$1" ]; then
    echo "usage: bash log_analyzer.sh <log_file>"
    exit 1
fi

file="$1"

if [ -f "$file" ]; then
    echo "log file exists"

    error=$(grep -ic "error" "$file")

warnings=$(grep -ic "warning" "$file")
echo " the total warnings: $warnings " 

    echo "The total errors: $error"
else
    echo "log file doesn't exist"
fi
