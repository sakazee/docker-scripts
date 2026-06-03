#!/bin/bash

echo "=== Docker Disk Usage ==="
docker system df

echo ""
echo "Detailed:"
docker system df -v
