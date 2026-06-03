#!/bin/bash

echo "=============================="
echo " Docker Safe Cleanup Started "
echo "=============================="

echo ""
echo "[1] Docker disk usage BEFORE:"
docker system df

echo ""
echo "[2] Removing stopped containers..."
docker container prune -f

echo ""
echo "[3] Removing unused networks..."
docker network prune -f

echo ""
echo "[4] Removing dangling images (SAFE)..."
docker image prune -f

echo ""
echo "[5] Removing build cache..."
docker builder prune -f

echo ""
echo "=============================="
echo " IMPORTANT: Volumes NOT touched "
echo " (to prevent data loss)"
echo "=============================="

echo ""
echo "[6] Docker disk usage AFTER:"
docker system df

echo ""
echo "DONE."
