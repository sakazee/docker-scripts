#!/bin/bash

TARGET=$1
SERVICE=$2

if [ -z "$TARGET" ]; then
  echo "Usage: restart <compose-path> [service]"
  exit 1
fi

if [ -z "$SERVICE" ]; then
  echo "Restarting full stack in $TARGET"
  (cd "$TARGET" && docker compose restart)
else
  echo "Restarting service $SERVICE in $TARGET"
  (cd "$TARGET" && docker compose restart "$SERVICE")
fi
