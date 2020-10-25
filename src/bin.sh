#!/bin/bash

# Get package path
SRC_PATH="$(dirname $(realpath $0))"

# LOAD IN USER ENV DATA FOR STRAPI
. ./.nginx.env

# SET DOCKER CONFIG
DOCKER_CONFIG="-f $SRC_PATH/docker-compose.yml --project-directory ./"

# SET GENERAL ENV DATA FOR DOCKER-COMPOSE
export HOSTNAME=$HOSTNAME

# GATHER EXTRA APPENDED ARGS
for arg in "${@:2}"; do
    if [ ! "$ARGS" ]; then
      ARGS="$arg"
    else
      ARGS="$ARGS $arg"
    fi
done

# FIGURE OUT ACTION FROM FIRST ARG
ACTION=$1

# START WITH AN EMPTY FILE VARIABLE
FILE=

# THEN MANUALLY FIGURE OUT WHAT FILE WE SHOULD LOAD
# could just pass this dynamically but we want to be extra sure
if [ $ACTION == 'up' ]; then
  FILE=up.sh
elif [ $ACTION == 'down' ]; then
  FILE=down.sh
elif [ $ACTION == 'exec' ]; then
  FILE=exec.sh
elif [ $ACTION == 'reload-config' ]; then
  FILE='reload-config.sh'
fi

# IF A FILE HAS BEEN MAPPED FROM AN ACTION:
if [ $FILE ]; then
  . $SRC_PATH/actions/$FILE
else
  echo Please provide a valid action
  exit 2
fi
