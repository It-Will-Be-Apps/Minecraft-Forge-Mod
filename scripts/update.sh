#!/bin/bash

# Script to keep the tools required for the repo up to date
echo 'Updating tools required for the repository...'

# Upgrade the Ubuntu managed packages
apt-get -y upgrade

# Update Git
echo 'Updating Git...'
apt-get -y install git
echo 'Git updated!'

# Update Java
echo 'Updating Java...'
apt-get -y install default-jdk
echo 'Java updated!'

# Get the currently installed version of Java
echo 'Removing older versions of Java...'
latest_version=$(dpkg --list | grep openjdk | awk '{print $2}' | sort -V | tail -n 1 | grep -oP '\d+' | head -n 1)

# Find and remove older versions of Java
installed_jdks=$(dpkg --list | grep openjdk | awk '{print $2}')
for jdk in $installed_jdks; 
do
    if [[ $jdk != *openjdk-"$latest_version"* ]]; then
        apt-get -y purge $jdk
    fi
done
echo 'Older versions of Java were removed...'
