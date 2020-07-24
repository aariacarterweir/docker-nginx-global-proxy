#!/bin/bash

echo "----"
echo "Stopping nginx-proxy service GLOBALLY"
echo "Stopping & removing container"
docker container stop nginx-proxy >/dev/null 2>&1
docker container rm nginx-proxy >/dev/null 2>&1
echo "Removing network"
docker network rm nginx-proxy >/dev/null 2>&1
echo "----"
