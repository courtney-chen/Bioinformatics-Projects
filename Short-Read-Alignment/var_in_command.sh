#!/usr/bin/env bash
# var_in_command.sh

# any command can be put inside a shell script, using variable
# run any Linux command or program from within a shell script


# Specify the Paired output directory as a relative path.
pairedPath="Paired/"

mkdir -p $pairedPath
# -p with mkdir means "create the directory if it exists, otherwise do nothing"
ls -lh $pairedPath
