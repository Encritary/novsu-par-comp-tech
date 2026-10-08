#!/bin/bash

DIR=$HOME
echo "Backing up $DIR..."
find $DIR -type f -mtime -1 | tar -zcvf backup-$(date "+%F_%H-%M-%S").tar.gz -T -
