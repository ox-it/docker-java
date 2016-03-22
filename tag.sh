#!/bin/bash

# Fail on any error.
set -e

git diff-index --quiet --cached HEAD || ( echo "Staged but not yet committed changes" 1>&2; exit 1)
git diff-files --quiet || ( echo "Working tree is dirty." 1>&2; exit 1)
test -z "$(git ls-files --exclude-standard --others)" || ( echo "Untracked files in working tree." 1>&2; exit 1)

docker build -t oxit/java .

version=$(docker run oxit/java sh -c 'echo ${JDK_VERSION}-${BUILD_VERSION}')
git tag -f $version
echo Tagged: $version
echo If it is all ok, run: git push --tags

