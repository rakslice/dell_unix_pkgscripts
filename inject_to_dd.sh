#!/bin/bash
set -e -u -x

disk="/home/rakslice/VirtualBox VMs/dell unix/dell_unix_buildscripts_tar.img"

dd if="$1" of="$disk" conv=notrunc bs=1024 count=1440
