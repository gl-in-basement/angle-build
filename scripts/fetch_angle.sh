#!/bin/bash
export PATH=$PWD/depot_tools:$PATH
echo "Bootstrapping angle"
cd angle
python scripts/bootstrap.py
gclient sync
git checkout main
