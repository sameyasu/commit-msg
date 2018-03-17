#!/bin/bash

frompath="./hooks/commit-msg"

if [ -z "$1" ]; then
    echo "Usage: $0 [repository path]"
    exit 1
fi

gitdir="$1/.git"

if [ ! -d "$gitdir" ]; then
    echo 'Not found .git directory.'
    exit 1
fi

destpath="$gitdir/hooks/commit-msg"

echo "Path: $destpath"

if [ -f $destpath ]; then
    echo "Warning: Found commit-msg script. "
    echo -n "Would you like to overwrite the script? [y/n]> "
    read reply
    if [ "$reply" != "y" ]; then
        echo "Canceled"
        exit 1
    fi
fi

if [ `cp -f $frompath $destpath` ]; then
    echo "Failed"
    exit 1
else
    echo "Installed"
fi
