#!/bin/bash

TARGET=$1

if [ -z "$TARGET" ]; then
  echo "Usage:"
  echo "./follow-logs.sh <container-name>"
  echo "or"
  echo "./follow-logs.sh <service-name (compose)>"
  exit 1
fi

echo "Following logs for: $TARGET"
docker logs -f --tail 100 "$TARGET"
