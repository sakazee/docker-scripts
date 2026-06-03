#!/bin/bash

echo "=============================="
echo " Docker Health Check Report"
echo "=============================="

echo ""
echo "📌 Docker Version:"
docker --version

echo ""
echo "📌 Docker Daemon Status:"
if docker info >/dev/null 2>&1; then
  echo "Docker is running"
else
  echo "Docker is NOT running or not accessible"
  exit 1
fi

echo ""
echo "📌 Running Containers:"
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

echo ""
echo "📌 Stopped Containers:"
docker ps -a --filter "status=exited" --format "table {{.Names}}\t{{.Status}}"

echo ""
echo "📌 Images Count:"
docker images -q | wc -l

echo ""
echo "📌 Volumes Count:"
docker volume ls -q | wc -l

echo ""
echo "📌 Network List:"
docker network ls

echo ""
echo "Done."
