#!/bin/bash

file1=$1
file2=$2
file3=$3

file_path1=~/$file1
file_path2=~/$file2
file_path3=~/$file3

rm "$file_path1"
rm "$file_path2"
rm "$file_path3"

echo "I deleted the following files:$file1, $file2, $file3"