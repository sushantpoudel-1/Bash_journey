#!/bin/bash

read -r file

if [ -d "$file" ]; then

    echo "file exists and can be used to backup"

    folder="$file"
    date=$(date +"%Y-%m-%d_%H-%M-%S")
    backup="backups/project_backup_$date.tar.gz"

    tar -czvf "$backup" "$folder"

    status="$?"

    if [ "$status" -ne 0 ]; then
        echo "backup couldn't be completed"
    else
        echo "backup is successfully completed"
    fi

else

    echo "the folder doesn't exist. Create one"

fi
