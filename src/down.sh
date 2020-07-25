#!/bin/bash

echo "----"
echo "Stopping nginx-proxy service GLOBALLY"

DIR="$(dirname $(realpath $0))"
docker-compose -f "$DIR/docker-compose.yml" --project-directory "$DIR" down

echo "Removing network"
docker network rm nginx-proxy >/dev/null 2>&1
echo "----"
