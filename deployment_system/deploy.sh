
#!/bin/bash
if [ -z "$1" ] || [ -z "$2" ]; then
echo " enter the source directory and deployment directory "
exit 1
fi
if [ ! -d "$1" ] || [ ! -d "$2" ]; then
echo " the source or deployment directory doesn't exist "
exit 1
fi
date=$(date "+%Y-%m-%d_%H-%M-%S")
mkdir -p backups
archive="backups/backup_$date.tar.gz"
tar -czf "$archive" -C "$2" .
status="$?"
if [ "$status" -eq 0 ]; then
echo " backup created successfully "
cp -a "$1"/. "$2"/
status="$?"
if [ "$status" -eq 0 ]; then
echo " deployment succeeded "
else
echo " deployment failed "
exit 1
fi
else
echo " backup failed "
exit 1
fi
