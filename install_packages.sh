#!/bin/bash

# Define the path to the file containing the list of packages
PACKAGE_LIST="installed_packages.txt"

# Check if the package list file exists
if [[ ! -f "$PACKAGE_LIST" ]]; then         
    echo "Package list file not found: $PACKAGE_LIST"
    exit 1
fi

# Read the package list file and install each package
while IFS= read -r package; do
    # Skip empty lines and comments
    [[ -z "$package" || "$package" =~ ^# ]] && continue

    echo "Installing $package..."
    sudo pacman -S --noconfirm "$package"
done < "$PACKAGE_LIST"

echo "All packages installed."
