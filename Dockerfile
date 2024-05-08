# Use an appropriate base image
FROM ubuntu:bionic

# Install required packages
RUN apt-get update && \
    apt-get install -y rsync openssh-client && \
    rm -rf /var/lib/apt/lists/*

# Copy the entrypoint script into the container
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Grant executable permissions to the entrypoint script
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entrypoint for the container
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
