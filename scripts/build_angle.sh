export PATH=$PWD/depot_tools:$PATH
echo "Building angle"
cd angle
python scripts/bootstrap.py
gclient sync
git checkout main
cat ../patches/angle-enable-static.txt >> BUILD.gn
gn gen out/Release --args='is_debug=false is_clang=true is_componented_build=false angle_assert_always_on=true'
autoninja -C out/Release
tar -czvf ../angle.tar.gz out/Release
