#!/bin/bash

git tag -f $(docker run oxit/java sh -c 'echo $JDK_VERSION')

