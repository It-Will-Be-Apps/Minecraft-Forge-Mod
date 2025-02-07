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
