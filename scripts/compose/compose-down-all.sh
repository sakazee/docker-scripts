#!/bin/bash

for dir in $(ls -d */); do
  if [ -f "$dir/docker-compose.yml" ]; then
    echo "Stopping $dir"
    (cd $dir && docker compose down)
  fi
done
