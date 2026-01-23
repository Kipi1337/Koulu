#!/bin/bash

read -p "Enter the directory path: " directory_path

object_count=$(find "$directory_path" -maxdepth 1 -type f | wc -l)

echo $object_count