#!/bin/bash
# Start the service with AndroidStudio

export UID
export GID=`id -g`
docker compose run --rm --name android_studio astudio 
