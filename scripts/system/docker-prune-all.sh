#!/bin/bash

echo "WARNING: This will remove ALL unused Docker resources"
read -p "Continue? (y/n): " confirm

if [ "$confirm" != "y" ]; then
  exit 1
fi

docker system prune -a --volumes -f
echo "System fully pruned"
