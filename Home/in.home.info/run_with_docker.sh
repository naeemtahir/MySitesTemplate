#!/bin/bash

ARCH=`dpkg --print-architecture`

echo "Stopping and removing existing container if exists"
docker container stop inhome && docker container rm inhome

case "$ARCH" in
   amd64)
      docker container run --name inhome -d -p 7070:80 --restart unless-stopped -v "$PWD":/var/www/html php:7.1.6-apache
      ;;

   armhf)
      docker container run --name inhome -d -p 7070:80 --restart unless-stopped -v "$PWD":/var/www/html arm32v7/php:7.1.6-apache
      ;;

   *)
      echo $"Unknown architecture $ARCH"
      exit 1
esac
