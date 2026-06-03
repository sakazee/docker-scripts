#!/bin/bash

docker ps --format "{{.Names}}" | while read container; do
  echo "================ $container ================"
  docker logs --tail 20 $container
done
