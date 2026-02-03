#!/bin/bash

# check if program is installed
is_program_installed() {
    command -v $1 > /dev/null 2>&1
}

# Ask for name of program to install
read -p "Enter the name of the program to install: " program_name

# Install the program using apt
sudo apt-get update
sudo apt-get install -y $program_name

# Check if the installation was successful
if is_program_installed $program_name; then
    echo "Installation of $program_name successful."
    exit 0  # Exit normally
else
    echo "Installation of $program_name failed."
    exit 111  # Exit with code 111
fi
