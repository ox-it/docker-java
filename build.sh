#!/bin/bash

# Fail on any error
set -e

# Quick shell script to build a copy of this image and push
docker build -t oxit/java .

version=$(docker run oxit/java sh -c 'echo ${JDK_VERSION}-${BUILD_VERSION}')

if [ $(docker images -q oxit/java:$version | wc -l) -gt 0 ]; then
	docker rmi  oxit/java:$version
fi
docker tag  oxit/java:latest oxit/java:$version

echo Tagged: oxit/java:$version
