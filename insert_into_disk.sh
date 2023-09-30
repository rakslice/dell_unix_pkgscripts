#!/bin/bash

disk="/home/rakslice/VirtualBox VMs/dell unix/dell_unix_buildscripts_tar.img"
#disk=testdisk.img

tar cvf temp.tar buildscripts


dd if=temp.tar of="$disk" conv=notrunc
