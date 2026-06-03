#!/bin/bash

echo "=============================="
echo " Docker Disk Usage Report"
echo "=============================="

echo ""
echo "📌 Overall Docker Disk Usage:"
docker system df

echo ""
echo "📌 Detailed Breakdown:"
docker system df -v

echo ""
echo "📌 Host Disk Usage (/var/lib/docker):"
df -h /var/lib/docker 2>/dev/null || df -h /

echo ""
echo "Done."
