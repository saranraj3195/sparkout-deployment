#!/bin/bash

# Debugging: Print out variable values
echo "DEPLOY_KEY: $DEPLOY_KEY"
echo "USERNAME: $USERNAME"
echo "SERVER_IP: $SERVER_IP"
echo "SERVER_PORT: $SERVER_PORT"
echo "SERVER_DESTINATION: $SERVER_DESTINATION"
echo "ARGS: $ARGS"
echo "FOLDER: $FOLDER"
echo "GITHUB_WORKSPACE: $GITHUB_WORKSPACE"

SSHPATH="$HOME/.ssh"

mkdir -p "$SSHPATH"

echo "$DEPLOY_KEY" > "$SSHPATH/key"

chmod 600 "$SSHPATH/key"

SERVER_DEPLOY_STRING="$USERNAME@$SERVER_IP:$SERVER_DESTINATION"

# Debugging: Print out rsync command
echo "rsync $ARGS -e 'ssh -i $SSHPATH/key -o StrictHostKeyChecking=no -p $SERVER_PORT' $GITHUB_WORKSPACE/$FOLDER $SERVER_DEPLOY_STRING"

# Sync files using rsync
#!/bin/bash
# Sync files using rsync
rsync $ARGS -e "ssh -i $SSHPATH/key -o StrictHostKeyChecking=no -p $SERVER_PORT" "$GITHUB_WORKSPACE/$FOLDER" "$SERVER_DEPLOY_STRING"
