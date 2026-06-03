#!/bin/bash

BACKUP_DIR="./backups/volumes"
DATE=$(date +%Y-%m-%d_%H-%M)

mkdir -p $BACKUP_DIR

echo "Backing up Docker volumes..."

for volume in $(docker volume ls -q); do
  echo "Backing up $volume"
  docker run --rm \
    -v ${volume}:/data \
    -v ${PWD}/${BACKUP_DIR}:/backup \
    alpine tar czf /backup/${volume}_${DATE}.tar.gz -C /data .
done

echo "Volume backup completed"
