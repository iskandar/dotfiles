#!/usr/bin/env bash

# set -e  # Exit on any non-zero exit code
set -x  # Echo all commands

if [ -n $1 ]; then
    echo "Collecting version info"
    ./versions.sh > versions.txt 2>&1
    if [ -z $VERSION_GIST_ID ]; then
        echo "Creating new Gist"
        GIST_URL=$(gist -c -p -d "Mac OS Versions" versions.txt)
        VERSION_GIST_ID=$(basename $GIST_URL)
        echo Created $GIST_URL
        echo "Add this somewhere in your exports:"
        echo "VERSION_GIST_ID=${VERSION_GIST_ID}"
    else
        echo "Updating existing Gist ${VERSION_GIST_ID}"
        GIST_URL=$(gist -u $VERSION_GIST_ID versions.txt)
    fi
    echo "GIST_URL: ${GIST_URL}"
fi

