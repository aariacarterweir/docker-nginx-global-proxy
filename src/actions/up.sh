#!/bin/bash

if [[ ! "$(docker network ls | grep nginx-proxy)" ]]; then
  echo "Creating nginx-proxy network ..."
  docker network create nginx-proxy
else
  echo "nginx-proxy network exists."
fi

if [[ ! "$(docker ps | grep nginx-proxy)" ]]; then

    if [[ "$(docker ps -aq -f name=nginx-proxy)" ]]; then
      docker-compose $DOCKER_CONFIG down --remove-orphans
    fi

    echo "Running Nginx Proxy in global nginx-proxy network ..."
    docker-compose $DOCKER_CONFIG up -d

else
  echo "Nginx Proxy already running."
fi
