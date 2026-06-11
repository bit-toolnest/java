#!/bin/bash
set -e

# uninstaller.sh — Uninstall Java 17 JDK if installed

# Function to check if Java 17 is installed
check_java17() {
    if command -v java >/dev/null 2>&1; then
        JAVA_VERSION=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')
        if [[ "$JAVA_VERSION" == 17* ]]; then
            return 0
        fi
    fi
    return 1
}

if check_java17; then
    echo "Java 17 JDK detected. Removing..."

    # Remove OpenJDK 17 JDK
    sudo apt-get remove --purge -y openjdk-17-jdk

    # Clean up unused dependencies
    sudo apt-get autoremove -y
    sudo apt-get clean

    echo "Java 17 JDK has been uninstalled."
else
    echo "Java 17 JDK is not installed. Nothing to remove."
fi
