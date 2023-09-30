#!/bin/bash
set -e -u -x

disk="/home/rakslice/VirtualBox VMs/dell unix/dell_unix_buildscripts_tar.img"

tar cv "$1" | dd of="$disk" conv=notrunc bs=1024 count=1440
