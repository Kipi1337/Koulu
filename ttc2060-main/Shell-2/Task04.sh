#!/bin/bash

# Prompt the user for a username
read -p "Enter the username: " username

# Check if the user already exists
if id -u "$username" &>/dev/null; then
    echo "Error: User '$username' already exists."
else
    # Create the user with home directory under /home/ and default shell as bash
    useradd -m -d "/home/$username" -s "/bin/bash" "$username"
    
    if [ $? -eq 0 ]; then
        echo "User '$username' created successfully with home directory '/home/$username' and default shell 'bash'."
    else
        echo "Error: Failed to create user '$username'."
    fi
fi