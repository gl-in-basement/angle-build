export PATH=$PWD/depot_tools:$PATH
echo "Building angle"
cd angle
gn gen out/Release --args='is_debug=false is_clang=true is_component_build=false angle_assert_always_on=true enable_thin_archive=false symbol_level=0'
autoninja -C out/Release
