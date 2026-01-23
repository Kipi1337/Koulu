#!/bin/bash

# Prompt the user for a file path
read -p "Enter the path of the file you want to remove: " file_path

# Check if the file exists
if [ -e "$file_path" ]; then
    # Check if it's a regular file
    if [ -f "$file_path" ]; then
        # Check if the file is empty
        if [ ! -s "$file_path" ]; then
            # Remove the file
            rm "$file_path"
            echo "The file '$file_path' has been removed."
        else
            echo "Error: The file '$file_path' is not empty."
        fi
    else
        echo "Error: '$file_path' is not a regular file."
    fi
else
    echo "Error: The file '$file_path' does not exist."
fi