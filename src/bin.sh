#!/bin/bash

##########################################################################
# credit: https://www.rent-a-hero.de/2017/06/09/use-j-wilders-nginx-proxy-for-multiple-docker-compose-projects/
# script to check if the jwilder proxy container is already running
# and if the ngnix-proxy network exists
##########################################################################

# Get package path
SRC_PATH="$(dirname $(realpath $0))"

# SET DOCKER CONFIG
DOCKER_CONFIG="-f $SRC_PATH/docker-compose.yml --project-directory $SRC_PATH"

# FIGURE OUT ACTION FROM FIRST ARG
ACTION=$1

# START WITH AN EMPTY FILE VARIABLE
FILE=

# THEN MANUALLY FIGURE OUT WHAT FILE WE SHOULD LOAD
# could just pass this dynamically but we want to be extra sure
if [[ $ACTION == 'up' ]]; then
  FILE=up.sh
elif [[ $ACTION == 'down' ]]; then
  FILE=down.sh
fi

# IF A FILE HAS BEEN MAPPED FROM AN ACTION:
if [[ $FILE ]]; then
  . $SRC_PATH/actions/$FILE
else
  echo Please provide a valid action
  exit 2
fi
