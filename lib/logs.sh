#!/bin/bash

CONTAINER=$1

if [ -z "$CONTAINER" ]; then
  echo "Usage: logs <container-name>"
  exit 1
fi

docker logs -f --tail 100 "$CONTAINER"
