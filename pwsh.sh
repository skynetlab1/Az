# Update the list of packages
sudo apt-get update
# Install prerequisite packages
sudo apt-get install -y wget apt-transport-https software-properties-common
# Download the Microsoft repository keys
wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb
# Register the Microsoft repository keys
sudo dpkg -i packages-microsoft-prod.deb
# Update the package list
sudo apt-get update
# Install PowerShell
sudo apt-get install -y powershell
# Start PowerShell
pwsh
