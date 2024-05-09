#!/bin/sh -l

sh -c "rsync -e 'ssh -i $1' -avz --delete $2 $3@$4:$5"
