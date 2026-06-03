#!/bin/bash

echo "=== Docker Health ==="

docker info >/dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "Docker is NOT running"
  exit 1
fi

echo "Docker OK"
echo ""

echo "Running containers:"
docker ps --format "table {{.Names}}\t{{.Status}}"

echo ""

echo "Stopped containers:"
docker ps -a --filter "status=exited" --format "table {{.Names}}\t{{.Status}}"
