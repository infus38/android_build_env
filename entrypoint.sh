#!/bin/bash

cleanup() {
    echo "Exiting gracefully..."
    exit 0
}

trap cleanup SIGINT

if [ -z "$TARGET" ]; then
    echo "TARGET is empty, please provide a valid target."
    exit 1
fi

source build/envsetup.sh
breakfast "$TARGET"
make -j"$JOBS_NUMBER"
