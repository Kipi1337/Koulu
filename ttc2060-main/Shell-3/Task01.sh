#!/bin/bash

list=()
# While loop for user input and appending to list
while true; do
  read -p "Enter a value(exit to stop): " value

  if [ "$value" == "exit" ]; then
    break
  else
    list+=("$value")
  fi
done

# Listing items with indexes

for index in ${!list[@]}; do

  echo "${index}) ${list[$index]}"

done