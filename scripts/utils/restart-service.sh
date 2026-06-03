#!/bin/bash

SERVICE_PATH=$1
SERVICE_NAME=$2

if [ -z "$SERVICE_PATH" ]; then
  echo "Usage: ./restart-service.sh <compose-path> [service-name]"
  exit 1
fi

if [ -z "$SERVICE_NAME" ]; then
  echo "Restarting full stack in $SERVICE_PATH"
  (cd "$SERVICE_PATH" && docker compose restart)
else
  echo "Restarting service: $SERVICE_NAME in $SERVICE_PATH"
  (cd "$SERVICE_PATH" && docker compose restart "$SERVICE_NAME")
fi

echo "Done"
