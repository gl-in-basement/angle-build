#!/bin/bash
set -euo pipefail
shopt -s inherit_errexit
echo "Patching buildscripts"
cd angle
patch -p0 -i ../patches/Build-Static-Library.patch
patch -p0 -i ../patches/Disable-Thin-Library.patch
