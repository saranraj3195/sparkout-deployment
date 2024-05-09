#!/bin/bash
set -eu

# Retrieve secrets from GitHub Actions
SSHPATH="$HOME/.ssh"
echo "$DEPLOY_KEY" > "$SSHPATH/key"
chmod 600 "$SSHPATH/key"

# Set up deployment server details using environment variables
SERVER_DEPLOY_STRING="$USERNAME@$SERVER_IP:$SERVER_DESTINATION"

# Define rsync options and execute the deployment
RSYNC_OPTIONS="-avz --delete"
sh -c "rsync $RSYNC_OPTIONS -e 'ssh -i $SSHPATH/key -o StrictHostKeyChecking=no -p $SERVER_PORT' $GITHUB_WORKSPACE/$FOLDER $SERVER_DEPLOY_STRING"
