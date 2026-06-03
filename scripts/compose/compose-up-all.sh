#!/bin/bash

for dir in $(ls -d */); do
  if [ -f "$dir/docker-compose.yml" ]; then
    echo "Starting $dir"
    (cd $dir && docker compose up -d)
  fi
done
