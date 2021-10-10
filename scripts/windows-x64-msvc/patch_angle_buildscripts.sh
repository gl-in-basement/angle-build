#!/bin/bash
set -euo pipefail
shopt -s inherit_errexit
echo "Patching buildscripts"
cd angle
patch -p1 -i ../patches/windows-x64-msvc/Build-Static-Library.patch
patch -p1 -i ../patches/windows-x64-msvc/Disable-Thin-Library.patch
