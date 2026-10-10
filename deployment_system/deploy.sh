if [  -z "$1"  ] || [ -z "$2" ]; then 
echo " enter the source directory and deployment directory "
exit 1
fi
if [ -d "$1" ] || [ -d "$2" ]; then 
echo " the source or deploment directory doesnt exist " 
exit 1
fi
date=$(date "+%Y-%m-%d_%H-%M-%S")
mkdir -p backups
archive="backups/backup_$date.tar.gz"
(cd "$2" && tar -czf "$archives" )
status="$?"
if [ "$status" -eq 0 ]; then 
echo " it is sucess "
else
echo " it didnt suceed "
cp -a "$1"/. "$2"/
fi

