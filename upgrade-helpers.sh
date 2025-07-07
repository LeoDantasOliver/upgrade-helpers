#!/usr/bin/env bash

# Function to upgrade all packages except those matching the given regex
upgrade-exclude() {
    if [ -z "$1" ]; then
        echo "Usage: upgrade-exclude <regex>"
        return 1
    fi
    local pattern="$1"
    local packages=$(apt list --upgradable 2>/dev/null | awk -F/ 'NR > 1 {print $1}' | grep -vE "$pattern")
    if [ -z "$packages" ]; then
        echo "No packages to upgrade after excluding '$pattern'."
        return 0
    fi
    echo "Upgrading packages (excluding '$pattern'):"
    echo "$packages"
    sudo apt install --only-upgrade $packages
}

# Function to upgrade only packages matching the given regex
upgrade-only() {
    if [ -z "$1" ]; then
        echo "Usage: upgrade-only <regex>"
        return 1
    fi
    local pattern="$1"
    local packages=$(apt list --upgradable 2>/dev/null | awk -F/ 'NR > 1 {print $1}' | grep -E "$pattern")
    if [ -z "$packages" ]; then
        echo "No packages matching '$pattern'."
        return 0
    fi
    echo "Upgrading only packages matching '$pattern':"
    echo "$packages"
    sudo apt install --only-upgrade $packages
}
