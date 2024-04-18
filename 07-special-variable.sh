#!/bin/bash

echo "all variable: $@"
echo "number of variables passed: $#"
echo "script name: $0"
echo "current working directory: $PWD"
echo "home directory of current user: $HOME"
echo "which user is running this script: $USER"
echo "hostname: $HOSTNAME"
echo "process ID of the current shell script: $$"
echo "process ID of last background command: $!"
