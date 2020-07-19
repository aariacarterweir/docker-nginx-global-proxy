#!/bin/bash
##########################################################################
# credit: https://www.rent-a-hero.de/2017/06/09/use-j-wilders-nginx-proxy-for-multiple-docker-compose-projects/
# script to check if the jwilder proxy container is already running
# and if the ngnix-proxy network exists
# should be called before "docker-compose up -d"
##########################################################################

if [ ! "$(docker network ls | grep nginx-proxy)" ]; then
  echo "Creating nginx-proxy network ..."
  docker network create nginx-proxy
else
  echo "nginx-proxy network exists."
fi

if [ ! "$(docker ps | grep nginx-proxy)" ]; then
    if [ "$(docker ps -aq -f name=nginx-proxy)" ]; then
        # cleanup
        echo "Cleaning Nginx Proxy ..."
        docker rm nginx-proxy
    fi
    # run your container in our global network shared by different projects
    echo "Running Nginx Proxy in global nginx-proxy network ..."
    docker run -d --name nginx-proxy -p 80:80 --network=nginx-proxy -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
else
  echo "Nginx Proxy already running."
fi