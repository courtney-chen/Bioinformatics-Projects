#!/usr/bin/env bash
# line_continue_comment_bad.sh

echo "This is a very long command. It is too long to fit within 80 characters \
# This comment is a bad idea
so I use backslash to continue on the next line."
# \ continues a line, can't put #comments in the middle, it will still be printed out
