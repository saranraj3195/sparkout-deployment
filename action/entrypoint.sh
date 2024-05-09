#!/bin/bash

SSHPATH="$HOME/.ssh"

mkdir -p "$SSHPATH"

echo "$DEPLOY_KEY" > "$SSHPATH/key"

chmod 600 "$SSHPATH/key"

SERVER_DEPLOY_STRING="$USERNAME@$SERVER_IP:$SERVER_DESTINATION"

# Sync files using rsync
sh -c "rsync $ARGS -e 'ssh -i $SSHPATH/key -o StrictHostKeyChecking=no -p $SERVER_PORT' $GITHUB_WORKSPACE/$FOLDER $SERVER_DEPLOY_STRING"
