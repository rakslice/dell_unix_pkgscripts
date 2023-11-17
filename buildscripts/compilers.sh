#!/bin/sh

sh gmp.sh
sh mpfr.sh
sh mpc.sh

sh binutils-2.14a.sh # newer binutils, doesn't run into header size problems like 2.13

sh gcc-3.0.4.sh # newer, before they removed varargs support
sh gcc-3.3.6.sh
sh gcc-3.4.6.sh # newest gcc building so far
