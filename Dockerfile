# Use a base image that includes PowerShell
FROM mcr.microsoft.com/powershell:latest

# Copy your PowerShell script into the container
COPY ./Az.ps1 /Az.ps1

# Run your PowerShell script
CMD pwsh /Az.ps1
