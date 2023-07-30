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

# ANSI color codes for light and dark mode
BLUE_COLOR="\033[94m"   
RESET_COLOR="\033[0m" # Reset to default color

echo -e "\nBuild Settings\n\
============================================\n\
# You can configure the number of jobs used during the build process.\n\
# Set the JOBS_NUMBER variable to the desired value.\n\
# By default, it uses the number of available CPU cores for parallel processing."

# Number of jobs used for build process.
if [ -z "$JOBS_NUMBER" ]; then
    JOBS_NUMBER=$(nproc) # Defaults to the number of available CPU cores.
fi 

# Display the current JOBS_NUMBER to the user 
echo -e "${BLUE_COLOR}> Current JOBS_NUMBER is set to: $JOBS_NUMBER${RESET_COLOR}\n\n\
Build process\n\
============================================"

source build/envsetup.sh
breakfast "$TARGET"
make -j"$JOBS_NUMBER"