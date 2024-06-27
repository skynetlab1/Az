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

# Add additional steps here
# For example, to copy a local script into the image:
# COPY ./your-script.sh /your-script.sh

# The command that will be run when a container is started from the image
CMD ["tfci", "run", "show", "help"]

