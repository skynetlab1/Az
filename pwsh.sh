#!/bin/bash

# Update the list of packages
sudo apt-get update -y

# Install pre-requisite packages
sudo apt-get install -y wget apt-transport-https software-properties-common

# Download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/ubuntu/24.04/packages-microsoft-prod.deb

# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb

# Update the list of products
sudo apt-get update -y

# Enable the "universe" repositories
sudo add-apt-repository -y universe

# Install PowerShell
sudo apt-get install -y powershell