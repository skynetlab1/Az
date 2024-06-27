# Use ARG instruction to define build-time variables
ARG TFC_AGENT_TOKEN
ARG TFC_AGENT_NAME

# Use ENV instruction to define runtime environment variables
ENV TFC_AGENT_TOKEN=$TFC_AGENT_TOKEN
ENV TFC_AGENT_NAME=$TFC_AGENT_NAME


# Use hashicorp/tfci as base image
FROM hashicorp/tfci:latest

# Set environment variables
ENV TF_HOSTNAME=your_value
ENV TF_API_TOKEN=your_value
ENV TF_CLOUD_ORGANIZATION=your_value
ENV CI=your_value
ENV GITHUB_ACTIONS=your_value
ENV GITHUB_OUTPUT=your_value
ENV GITHUB_SHA=your_value
ENV GITHUB_ACTOR=your_value


# Install Azure CLI and PowerShell
RUN apt-get update && apt-get install -y azure-cli powershell

# Add Azure login command
RUN az login --service-principal -u $AZURE_SERVICE_PRINCIPAL -p $AZURE_CLIENT_SECRET --tenant $AZURE_TENANT_ID

# Add Azure account connection command
RUN pwsh -c "Connect-AzAccount -ServicePrincipal -Credential (New-Object System.Management.Automation.PSCredential($AZURE_SERVICE_PRINCIPAL, (ConvertTo-SecureString -String $AZURE_CLIENT_SECRET -AsPlainText -Force))) -Tenant $AZURE_TENANT_ID"

# The command that will be run when a container is started from the image
CMD ["tfci", "run", "show", "help"]

# Set GitHub environment variables
ENV GITHUB_TOKEN your_token
ENV GITHUB_USER your_username
# Add any other variables you need

# Install Azure CLI
RUN apt-get update && \
    apt-get install ca-certificates curl apt-transport-https lsb-release gnupg && \
    curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/azure-cli.list && \
    apt-get update && apt-get install azure-cli

# Install Ansible
RUN apt-get update && \
    apt-get install software-properties-common && \
    apt-add-repository --yes --update ppa:ansible/ansible && \
    apt-get install ansible

# Install VSTS agent dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        jq \
        git \
        iputils-ping \
        libcurl4 \
        libicu60 \
        libunwind8 \
        netcat \
        libssl1.0

# Create a directory for the VSTS agent
RUN mkdir -p /vsts/agent

# Set the working directory to the VSTS agent directory
WORKDIR /vsts/agent

# Copy start.sh script to container. This script should handle the configuration of the VSTS agent
COPY start.sh .
RUN chmod +x start.sh

# Run the start.sh script when the container starts
CMD ["./start.sh"]
p