#!/bin/bash

DATE=$(date +%Y-%m-%d_%H-%M)
BACKUP_DIR="./backups/containers"
mkdir -p $BACKUP_DIR

docker ps -q | while read container; do
  name=$(docker inspect --format='{{.Name}}' $container | sed 's/\///')

  echo "Saving $name"
  docker commit $container ${name}_backup:$DATE
  docker save ${name}_backup:$DATE -o $BACKUP_DIR/${name}_${DATE}.tar
done

echo "All containers backed up"
