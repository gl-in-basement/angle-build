#!/bin/bash
set -euo pipefail
shopt -s inherit_errexit
echo "Patching buildscripts"
cd angle
patch -i ../patches/Build-Static-Library.patch
patch -i ../patches/Disable-Thin-Library.patch
