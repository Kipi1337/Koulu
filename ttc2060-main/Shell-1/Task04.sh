#!/bin/bash

read -p "Enter the source file path: " source
read -p "Enter the destination file path: " destination

cp "$source" "$destination"

echo "Copied the \"$source\" to \"$destination\""