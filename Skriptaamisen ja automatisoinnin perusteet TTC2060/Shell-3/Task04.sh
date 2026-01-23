#!/bin/bash

list+=()

# While loop for appending to list
while true; do
read -p "Enter the directory path(type exit to stop): " directory_path

if [ "$directory_path" == "exit" ]; then
    break
else
  list+=("$directory_path")
fi
done

for path in "${list[@]}"; do
    if [ -d "$path" ]; then
        object_count=$(find "$path" -maxdepth 1 -type f -or -type d | wc -l)
        echo "Objects in $path: $((object_count - 1))"  # Subtract 1 to exclude the directory itself
    else
        echo "$path is not a directory."
    fi
done