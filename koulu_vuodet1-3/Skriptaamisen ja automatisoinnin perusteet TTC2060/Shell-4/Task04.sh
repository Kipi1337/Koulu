#!/bin/bash

# retrieve network information
network_information() {
    # IP address
    ip_address=$(ip -o -4 addr show scope global | awk '{print $4}' | cut -d'/' -f1)

    # hostname
    host_name=$(hostname)

    # Display network information
    echo "Network Information:"
    echo "IP Address: $ip_address"
    echo "Hostname: $host_name"

    # Log information to syslog with custom tag
    logger -p user.info -t network-information "IP Address: $ip_address, Hostname: $host_name"
}

# Call network_information function
network_information
