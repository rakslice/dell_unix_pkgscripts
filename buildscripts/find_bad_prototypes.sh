#!/bin/sh

# a script to find pkgtemplates prototype files with
# badly formed symlink target paths

/usr/local/bin/grep '^s .*=' pkgtemplates/*/prototype | grep -v '=./' | grep -v '=../'
