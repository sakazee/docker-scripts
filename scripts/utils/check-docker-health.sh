#!/bin/bash

echo "Docker version:"
docker --version

echo ""
echo "Running containers:"
docker ps

echo ""
echo "Disk usage:"
docker system df
