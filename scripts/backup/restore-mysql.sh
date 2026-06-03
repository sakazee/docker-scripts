#!/bin/bash

source ../config/mysql.env

FILE=$1

if [ -z "$FILE" ]; then
  echo "Usage: ./restore-mysql.sh backup.sql"
  exit 1
fi

echo "Restoring MySQL..."

cat $FILE | docker exec -i $MYSQL_CONTAINER \
  mysql -u $MYSQL_USER -p$MYSQL_PASSWORD

echo "Restore completed"
