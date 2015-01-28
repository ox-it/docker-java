#!/bin/bash

git tag $(docker run oxit/java sh -c 'echo $JDK_VERSION')
