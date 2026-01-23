#!/bin/bash

# Create a new folder
mk_folder() {
    read -p "Enter the path for the new folder: " folder_path
    echo "Creating folder: $folder_path"
    mkdir -p "$folder_path"
}

# Download an image and rename it
download_image() {
    echo "Downloading image..."
    wget -O "$folder_path/image.png" "https://student.labranet.jamk.fi/~pekkju/script/tux.png"
}

# change folder and image permissions
change_perm() {
    echo "Changing folder and image permissions..."
    chmod 700 "$folder_path"
    chmod 700 "$folder_path/image.png"
}

# Main script

# Call mk_folder
mk_folder

# Call download_image
download_image

# Call change_perm
change_perm

echo "Script execution completed."
