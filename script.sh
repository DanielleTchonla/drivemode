#!/bin/bash
set -e

COMMAND=$1
PROJECT_DIR="/input"

# Check if 'produce' is an argument
if [ "$COMMAND" = "produce" ]; then
    mkdocs build -f "$PROJECT_DIR/mkdocs.yml" -d /output
    tar -czf - -C /output .
elif [ "$COMMAND" = "serve" ]; then
    mkdir /temp-site
    tar -xzf /dev/stdin -C /temp-site
    cd /temp-site
    python3 -m http.server 8000
else
    echo "COMMAND NOT FOUND"
    exit 1
fi