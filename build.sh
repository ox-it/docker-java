#!/bin/bash

# Fail on any error
set -e

# Quick shell script to build a copy of this image and push
docker build -t oxit/java .

version=$(docker run oxit/java sh -c 'echo ${JDK_VERSION}-${BUILD-VERSION}')
docker tag -f oxit/java:latest oxit/java:$version
