#!/bin/bash

# Bash source for current dirpath
directory="$(readlink -f "$0")"

#count objects
object_count=$(find "$directory" -maxdepth 1 | ls -l | wc -l)

echo $object_count