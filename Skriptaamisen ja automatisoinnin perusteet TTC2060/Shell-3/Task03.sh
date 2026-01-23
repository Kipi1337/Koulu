#!/bin/bash

# Read directory path
read -p "Enter the directory path: " directory_path

# Count objects in a given directory path
object_count=$(find "$directory_path" -maxdepth 1 | wc -l)

echo $object_count
