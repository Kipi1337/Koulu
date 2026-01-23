#!/bin/bash

# Check if no arguments are provided
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <file/directory paths>"
    exit 1
fi

# Loop through each command-line argument
for path in "$@"; do
    # Check if the path exists
    if [ -e "$path" ]; then
        # Check if it's a regular file
        if [ -f "$path" ]; then
            echo "$path: File"
        # Check if it's a directory
        elif [ -d "$path" ]; then
            echo "$path: Directory"
        else
            echo "$path: Something else"
        fi
    else
        echo "$path: Does not exist"
    fi
done