#!/bin/bash

# Check if the file /etc/hosts exists
if [ -e "/etc/hosts" ]; then
    echo "/etc/hosts is available."

    # Check if the user has permission to write to /etc/hosts
    if [ -w "/etc/hosts" ]; then
        echo "You have permission to edit the file."
    else
        echo "You don't have permission to edit the file."
    fi
else
    echo "/etc/hosts does not exist."
fi