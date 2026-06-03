#!/bin/bash

echo "WARNING: This will remove unused docker resources"
read -p "Continue? (y/n): " confirm

if [ "$confirm" != "y" ]; then
  echo "Cancelled"
  exit 0
fi

docker system prune -a --volumes -f

echo "Cleanup done"
