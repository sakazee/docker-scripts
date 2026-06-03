#!/bin/bash

source ../config/mysql.env

DATE=$(date +%Y-%m-%d_%H-%M)
BACKUP_DIR="./backups/mysql"

mkdir -p $BACKUP_DIR

echo "Starting MySQL backup..."

docker exec $MYSQL_CONTAINER mysqldump \
  -u $MYSQL_USER -p$MYSQL_PASSWORD \
  --all-databases \
  --single-transaction \
  --quick \
  > $BACKUP_DIR/mysql_$DATE.sql

echo "MySQL backup completed"
