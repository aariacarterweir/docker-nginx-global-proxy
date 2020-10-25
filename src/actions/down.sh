#!/bin/bash

# Get package path
SRC_PATH="$(dirname $(realpath $0))"

# Source config file
. "$SRC_PATH/config.sh"

echo "----"
echo "Stopping nginx-proxy service GLOBALLY"

docker-compose $DOCKER_CONFIG down

echo "Removing network"
docker network rm nginx-proxy >/dev/null 2>&1
echo "----"
