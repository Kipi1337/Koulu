##!/bin/bash

# Ping url with 1 packet

ping_url() {
    ping -c 1 "$url" > /dev/null 2>&1
    return $?
}

# Ask url from user
read -p "Enter a URL to ping: " user_url

# call ping_url with user given url
ping_url "$user_url"
exit_status=$?

# exit code
if [ $exit_status -eq 0 ]; then
    echo "Ping successful. Exit code: 0"
    exit 0
else
    echo "Ping failed. Exit code: 1"
    exit 1
fi

