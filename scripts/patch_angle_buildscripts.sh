#!/bin/bash
set -euo pipefail
shopt -s inherit_errexit
echo "Patching buildscripts"
cd angle
patch -p1 -i ../patches/Build-Static-Library.patch
patch -p1 -i ../patches/Disable-Thin-Library.patch
