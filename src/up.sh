#!/bin/sh
##########################################################################
# credit: https://www.rent-a-hero.de/2017/06/09/use-j-wilders-nginx-proxy-for-multiple-docker-compose-projects/
# script to check if the jwilder proxy container is already running
# and if the ngnix-proxy network exists
# should be called before "docker-compose up -d"
##########################################################################

# Get package path
SRC_PATH="$(dirname $(realpath $0))"

# Source config file
. "$SRC_PATH/config.sh"

if [ ! "$(docker network ls | grep nginx-proxy)" ]; then
  echo "Creating nginx-proxy network ..."
  docker network create nginx-proxy
else
  echo "nginx-proxy network exists."
fi

if [ ! "$(docker ps | grep nginx-proxy)" ]; then

    if [ "$(docker ps -aq -f name=nginx-proxy)" ]; then
      docker-compose $DOCKER_CONFIG down --remove-orphans
    fi

    echo "Running Nginx Proxy in global nginx-proxy network ..."
    docker-compose $DOCKER_CONFIG up -d

else
  echo "Nginx Proxy already running."
fi
