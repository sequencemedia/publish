#!/bin/bash

PATTERN="([0-9]+)\.([0-9]+)\.([0-9]+)"
NAME=$(node -p "require('./package').name")
VERSION=$(node -p "require('./package').version")
PUBLISHED_VERSION=$(npm view $NAME version)

echo Version is $VERSION
echo Published version is $PUBLISHED_VERSION

[[ $VERSION =~ $PATTERN ]]

VERSION_MAJOR="${BASH_REMATCH[1]}"
VERSION_MINOR="${BASH_REMATCH[2]}"
VERSION_PATCH="${BASH_REMATCH[3]}"

[[ $PUBLISHED_VERSION =~ $PATTERN ]]

PUBLISHED_VERSION_MAJOR="${BASH_REMATCH[1]}"
PUBLISHED_VERSION_MINOR="${BASH_REMATCH[2]}"
PUBLISHED_VERSION_PATCH="${BASH_REMATCH[3]}"

if [ $VERSION_MAJOR -gt $PUBLISHED_VERSION_MAJOR ] || [ $VERSION_MINOR -gt $PUBLISHED_VERSION_MINOR ] || [ $VERSION_PATCH -gt $PUBLISHED_VERSION_PATCH ]
then
  set +e

  npm i --force
  npm publish

  if [[ $? != 0 ]];
  then
    echo Version $VERSION was not published
  else
    echo Published version $VERSION
  fi
fi
