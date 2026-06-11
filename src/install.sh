#!/bin/bash
set -e

# install.sh — Install Java 17 JDK if not already installed

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
    echo "Java 17 JDK is already installed."
else
    echo "Java 17 JDK not found. Installing..."

    # Update package index
    sudo apt-get update -y

    # Install OpenJDK 17 JDK
    sudo apt-get install -y openjdk-17-jdk

    echo "Java 17 JDK installation complete."
fi

# Verify installation
java -version
