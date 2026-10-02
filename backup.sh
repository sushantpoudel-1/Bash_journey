#!/bin/bash



if [ -z "$1" ] || [ -z "$1" ] ; then
echo " usage:  enter a valid arguments  "
exit 1
fi

mkdir -p backups


file="$1"

if [ -d "$file" ]; then

    echo "file exists and can be used to backup"

    folder="$file"
    date=$(date +"%Y-%m-%d_%H-%M-%S")
    backup="backups/project_backup_$date.tar.gz"

    tar -czvf "$backup" "$folder"

    status="$?"

    if [ "$status" -ne 0 ]; then

        echo "backup couldn't be completed"
echo "$(date '+%Y-%m-%d %H:%M:%S') - Backup of $folder completed successfully" >> "$log"
    else

        echo "backup is successfully completed"
        echo "$(date) - Backup of $folder completed successfully" >> "$log"

ls -t backups/*.tar.gz | tail -n +6 | xargs rm
    fi

else

    echo "the folder doesn't exist. Create one"
echo "$(date '+%Y-%m-%d %H:%M:%S') - Backup of $folder failed" >> "$log"
fi
