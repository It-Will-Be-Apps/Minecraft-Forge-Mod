#!/bin/bash

# Script to show the status and version of the tools required for the repo
echo 'Summary of the tools required for the repository:'

# Show the installed version of Git
git --version

# Show the installed version of Java
java -version











#!/bin/bash

# Script to download the latest version of the Minecraft Forge SDK

# Define the URL for the latest Minecraft Forge SDK
FORGE_URL="https://files.minecraftforge.net/maven/net/minecraftforge/forge/index_1.16.5.html"

# Use wget to download the latest version of the Minecraft Forge SDK
echo "Downloading the latest version of the Minecraft Forge SDK..."
wget -O forge-installer.jar $FORGE_URL

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Minecraft Forge SDK downloaded successfully."
else
    echo "Failed to download the Minecraft Forge SDK."
    exit 1
fi

# Provide instructions to run the installer
echo "To install the Minecraft Forge SDK, run the following command:"
echo "java -jar forge-installer.jar"





#!/bin/bash

# Script to download the latest version of the Minecraft Forge SDK

# Define the base URL for the Minecraft Forge SDK
BASE_URL="https://files.minecraftforge.net/maven/net/minecraftforge/forge/"

# Fetch the latest version URL dynamically
LATEST_URL=$(curl -s $BASE_URL | grep -oP '(?<=href=")[^"]*installer.jar(?=")' | head -n 1)

# Check if the URL was found
if [ -z "$LATEST_URL" ]; then
    echo "Failed to find the latest version of the Minecraft Forge SDK."
    exit 1
fi

# Construct the full URL
FULL_URL="${BASE_URL}${LATEST_URL}"

# Use wget to download the latest version of the Minecraft Forge SDK
echo "Downloading the latest version of the Minecraft Forge SDK..."
wget -O forge-installer.jar $FULL_URL

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Minecraft Forge SDK downloaded successfully."
else
    echo "Failed to download the Minecraft Forge SDK."
    exit 1
fi

# Provide instructions to run the installer
echo "To install the Minecraft Forge SDK, run the following command:"
echo "java -jar forge-installer.jar"









#!/bin/bash

# Script to update the Minecraft Forge SDK to the latest version

# Define the base URL for the Minecraft Forge SDK
BASE_URL="https://files.minecraftforge.net/maven/net/minecraftforge/forge/"

# Fetch the latest version URL dynamically
LATEST_URL=$(curl -s $BASE_URL | grep -oP '(?<=href=")[^"]*installer.jar(?=")' | head -n 1)

# Check if the URL was found
if [ -z "$LATEST_URL" ]; then
    echo "Failed to find the latest version of the Minecraft Forge SDK."
    exit 1
fi

# Construct the full URL
FULL_URL="${BASE_URL}${LATEST_URL}"

# Backup the existing installer if it exists
if [ -f forge-installer.jar ]; then
    echo "Backing up the existing installer..."
    mv forge-installer.jar forge-installer-backup.jar
fi

# Use wget to download the latest version of the Minecraft Forge SDK
echo "Downloading the latest version of the Minecraft Forge SDK..."
wget -O forge-installer.jar $FULL_URL

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Minecraft Forge SDK downloaded successfully."
else
    echo "Failed to download the Minecraft Forge SDK."
    exit 1
fi

# Provide instructions to run the installer
echo "To install the Minecraft Forge SDK, run the following command:"
echo "java -jar forge-installer.jar"