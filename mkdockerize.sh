#!/bin/bash
set -e

IMAGE_NAME="mkdocs-producer"

if [ "$1" = "produce" ]; then
    docker run --rm -v $(pwd)/my-mkdocs-site:/input $IMAGE_NAME produce > site.tar.gz
elif [ "$1" = "serve" ]; then
    cat site.tar.gz | docker run --rm -i -p 8000:8000 $IMAGE_NAME serve
else
    echo "COMMAND NOT FOUND"
    exit 1
fi