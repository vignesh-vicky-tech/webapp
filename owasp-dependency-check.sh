#!/bin/sh
DC_DIRECTORY="$HOME/OWASP-Dependency-Check"
DATA_DIRECTORY="$DC_DIRECTORY/data"
REPORT_DIRECTORY="$DC_DIRECTORY/reports"
CACHE_DIRECTORY="$DC_DIRECTORY/data/cache"
if [ ! -d "$DATA_DIRECTORY" ]; then
    echo "Initially creating persistent directory: $DATA_DIRECTORY"
    mkdir -p "$DATA_DIRECTORY"
    chmod -R 777 "$DATA_DIRECTORY"
fi

if [ ! -d "$REPORT_DIRECTORY" ]; then
    echo "Initially creating persistent directory: $REPORT_DIRECTORY"
    mkdir -p "$REPORT_DIRECTORY"
    chmod -R 777 "$REPORT_DIRECTORY"
fi

if [ ! -d "$CACHE_DIRECTORY" ]; then
    echo "Initially creating persistent directory: $CACHE_DIRECTORY"
    mkdir -p "$CACHE_DIRECTORY"
    chmod -R 777 "$CACHE_DIRECTORY"
fi
docker pull owasp/dependency-check
docker run --rm \
    --volume $(pwd):/src \
    --volume "$DATA_DIRECTORY":/usr/share/dependency-check/data \
    --volume "$REPORT_DIRECTORY":/report \
    owasp/dependency-check \
    --scan /src \
    --format "ALL" \
    --project "My OWASP Dependency Check Project" \
    --out /report
